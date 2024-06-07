---
title: "Intro to Snakemake"
author: "UM Bioinformatics Core"
output:
        html_document:
            includes:
                in_header: header.html
            theme: paper
            toc: true
            toc_depth: 4
            toc_float: true
            number_sections: false
            fig_caption: true
            markdown: GFM
            code_download: true
---
<style type="text/css">
body{ /* Normal  */
      font-size: 14pt;
  }
pre {
  font-size: 12pt
}
</style>

By the end of this module, we will:
* List the advantages of a robust workflow automation solution like Snakemake.
* Compare graph transformation in addition to wide and tall transformations.
* Describe the fundamental relationship between Snakemake, a Snakefile, and the file system.
* Describe key parts of a Snakemake rule.
* Build a Snakefile and use Snakemake to automate a simple transform.
* Use wildcards to easily extend a workflow to new inputs.
* Show a Snakemake dry-run and other ways to visualize the workflow.


## What is Snakemake?

### Consider a "traditional" data workflow

TODO: Pic
This is a single script with three steps to transform raw chicken into fried
chicken. Note that there is one input and one output to this pipeline.

### An equivalent Snakefile

TODO: Pic
By declaring the inputs and outputs for each of the rules, Snakemake now 
understands the relationship of the individual rules.

### Snakemake Interprets the Snakefile

TODO: Pic
Snakemake is a python program that interprets the Snakefile against the file
system and uses rules to transform inputs into outputs as necessary. Snakemake
is essentially **declarative** meaning that you don't tell it what to do, you
simply ask for the final output and Snakemake figures out what it needs to do.
That declarative pattern enables key functionality:
- Snakemake workflows can gracefully extend to new inputs.
- Snakemake is modular.
- Snakemake is portable.
- Snakemake is “durable” (i.e it crashes with poise).
- Snakemake is efficient.

### Snakemake is efficient
TODO: Pic

A. Consider a traditional workflow with four transformation steps. Each step has
a expected run-time (height) and also requires a certain amount of resources
(CPUs, memory, etc.) (width). To run these steps in a single script, I have to
allocate the maximum amount of resources for the entire execution time. The
resulting "whitespace" is wasted money or wasted resources.

B. Multiplexing makes this worse.

C. Snakemake rules declare their resource footprints individually. Snakemake can
pack transformations tighter and automatically parallelize anything that fits
into your resource allocation.

### Snakemake lets you focus on your workflow
TODO: Pic

Snakemake neatly separates the general concerns of workflow automation from the
specific steps of your workflow.


## Build a Snakefile

To build a Snakefile it's helpful to use a concrete example and also helpful to
adapt an existing script. The script below considers the 1868 novel "Little
Women", by Louisa May Alcott. It outputs a file containing the ranked name
counts for each of the four March sisters: Amy, Beth, Jo, and Laurie. (And it
also emits a few intermediate files).

    #!/bin/bash
    # Which of the March sisters is referred to most often in
    # part 1 of the Little Women?
    
    # Split lines into words
    cat inputs/little_women_part_1.txt \
        | tr -cs '[:alpha:]' '\n' \
        > 1.split_words.txt
    
    # Count words
    sort 1.split_words.txt | uniq -c \
        > 2.count_words.txt
    
    # Sort words by descending count and add header
    sort -k1,1nr 2.count_words.txt \
        | awk 'BEGIN {print "word\tcount"} { print $2 "\t" $1}' \
        > 3.sort_counts.txt
    
    # Select names with respective counts
    egrep '^(Jo|Amy|Laurie|Beth)\s' 3.sort_counts.txt > 4.select_words.txt
    
    # Print excerpts of input and results from each step
    head inputs/little_women_part_1.txt `ls *.txt` | less


You can examine the input:

    less inputs/little_women_part_1.txt
    # type ctrl-q to exit the less command


You can execute this script:

    export WORKSHOP_HOME="/nfs/turbo/umms-bioinf-wkshp/workshop/home/${USER}"
    cd $WORKSHOP_HOME/alcott-script
    ./alcott-script.sh

And view an except of the results:

    head `ls *.txt` | less
    
    ==> 1.split_words.txt <==
    CHAPTER
    ONE
    PLAYING
    PILGRIMS
    Christmas
    won
    t
    be
    Christmas
    without
    
    ==> 2.count_words.txt <==
       1992 a
         75 A
          1 aback
          1 abase
          3 abashed
          1 abed
          1 abject
          3 able
          3 abominable
          1 abominably
    
    ==> 3.sort_counts.txt <==
    word    count
    and     3811
    the     3303
    to      2303
    a       1992
    I       1988
    her     1660
    of      1490
    in      1094
    you     1010
    
    ==> 4.select_words.txt <==
    Jo      737
    Laurie  319
    Beth    294
    Amy     283


A Snakefile is a simple markdown file. It is composed of rules; each rule specifies directives such as input, output, and shell. By convention, the snakefile is named `Snakefile` and lives in the `workflow` sub-directory. We will keep the inputs and outputs in separate directories.
TODO: Example

The snakemake program is installed as a module on Great Lakes.

`module load snakemake`

The `snakemake` python program interprets the Snakefile and executes rules as appropriate to produce the expected output. When launching snakemake, You specify the number of cores (i.e. CPUs) with the -c flag.

`snakemake -c2`

TODO interpreting the snakemake output & check the outputs dir.

Adding a new rule. By default, snakemake executes the first rule. Alternatively, 
you can provide a rule name or an output file.

You can use variables in the shell directive:
TODO {input} {output}

Use triple quotes to create multiline shell commands. If your commands use curly braces ({}) you need to double them so snakemake doesn't get confused.

Note that snakemake will only run the rules it needs to (based on changes in
files or scripts or missing files). You can preview what Snakemake will do by
using the dry-run flag `--dry-run` or `-n`. This will show the typical snakemake
output but will not change any files.



---

One target to rule them all:


Extending to run new inputs
Expand
https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#the-expand-function

Adding a config file

Adding a param directive

Visualize the directed acyclic graph and rules.

### Pro tips

1. Start learning Snakemake with a simple workflow. Don't start with a really
   complex workflow.
2. It's ok to build your Snakefile from the first steps toward the last,
   but remember that Snakemake "thinks" from the last output backward.
3. Keep your inputs, outputs, and workflow in separate directories.
4. Build your Snakefile incrementally.
   a) Start with a single input.
   b) Add a rule at a time.
   c) Make small changes and  use `dry-run` liberally.
   d) OK to start by hardcoding filenames; put the wildcards in afterward.
5. Keep consistent naming conventions. Including your rule names in your file
   names will help you troubleshoot. Some people include numbers in the file
   names or place different outputs in different directories. Choose a pattern
   that works for you and be consistent.
6. If you subset your input data so that your steps are fast and light, you 
   can prototype the Snakefile on the login-nodes. (But be ready to hit control-C
   if you wander into a computationally intensive step.)
7. Use spaces not tabs.
8. Use config files to avoid hardcoding paths of "magic values".

## Key ideas

* A robust workflow automation solution is great because:
  * it supports simple (e.g. wide or tall) and complex (e.g. graph)
    transformations equally well
  * only outstanding steps are run and individual steps are atomic
  * it's designed with software dependency management in mind
  * it's easy to tune, resulting in higher resource efficiency
  * it's portable across execution environments
  * it's designed to gracefully scale to many inputs
  * all the capabilities above don't obscure the actual data transfromation
* Snakemake is a Python program that evaluates the rules in a Snakefile against
  the file system and applies rules as necessary to produce the desired output 
  files.
* The Snakefile is a simple markdown file composed of rules. Each rule contains
  **directives** that specify inputs, outputs, commands to run foe that rule.
* Snakemake builds the intended set of rules into a **directed acyclic graph** 
  (DAG).
* The **dry-run** enables you to see the rules it will execute in advance.
* You can visualize the Snakemake DAG or rulegraph using `dot`.


References and links:
- https://snakemake.readthedocs.io/en/stable/index.html

Exercise 1A:
cd to the project publication_snakemake_1
Given this DAG can you fill in the missing parts of this Snakefile?


Exercise 1B:
Use params and a config file to extract hardcoded inputs and "magic values".

| [Back to Introduction](Module00_Introduction.html) | [Top of this lesson](#top) | [Next lesson](Module FIXME .html) |
| :--- | :----: | ---: |
