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
* List the advantages of a robust workflow automation solution like Snakemake
* Compare graph transformation in addition to wide and tall transformations
* Describe the fundamental relationship between Snakemake, a Snakefile, and the file system
* Describe key parts of a Snakemake rule
* Build a Snakefile and use Snakemake to automate a simple transform
* Use wildcards to easily extend a workflow
* Show a Snakemake dry-run, directed acyclic graph, and rulegraph

## Header 1

## Header 2

### Pro tips

1. It's ok to build your Snakefile from the first steps toward the last,
   but remember that Snakemake "thinks" from the last output backward.
2. Build your Snakefile incrementally.
   a) Start with a single input.
   b) Add a rule at a time.
   c) Make small changes and  use `dry-run` liberally.
   d) Start by hardcoding filesnames; put the wildcards in afterward.
3. Keep consistent naming conventions. Including your rule names in your file
   names will help you troubleshoot. Some people include numbers in the file
   names or place different outputs in different directories. Choose a pattern
   that works for you and be consistent.
4. If you subset your input data so that your steps are fast and light, you 
   can prototype the Snakefile on the login-nodes. (But be ready to hit control-C
   if you wander into a computationally intensive step.)
5. TODO Troubleshooting

## Key ideas

* A robust workflow automation solution is great because:
  * it supports simple (w.g. wide or tall) and complex (e.g. graph)
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
* Snakemake builds the intended set of transforms into a directed acyclic graph 
  or DAG. A dry-run enables you to see the rules it will execute in advance.
  You can visualize the Snakemake DAG or rulegraph using `dot`.


| [Back to Introduction](Module00_Introduction.html) | [Top of this lesson](#top) | [Next lesson](Module FIXME .html) |
| :--- | :----: | ---: |
