---
title: "Intro to workflow automation"
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
table.fig, th.fig, td.fig {
  border: 1px solid black;
  border-collapse: collapse;
  padding: 15px;
}
</style>

By the end of this module, we will:

- Understand what workflow automation is and how it helps reproducibility.
- Review several different ways to execute repetitive tasks on Great Lakes.
- Introduce the idea of job/task geometries to visualize approachs and their advantages and limitations.


## Workflow automation helps reproducibility

Data-intensive research entails transforming raw data into more
meaningful/valuable results. Often, this involves a series of step-wise
transformation tasks. To make this research reproducible by someone else, all the 
transformations must either be documented so that a human can reproduce them, or
automated so a computer can. A reproducible solution has a blend of 
documentation and automation.

Data-intensive research often involves repeating transformation tasks many
times. Also overtime transformations evolve to be more complex, more
computationally demanding, or take longer. A **workflow** describes the key
transformation tasks and their relationships to the inputs and outputs.

**Workflow automation** describes the tools and techniques to systematically
assemble these tasks into a executable, repeatable, robust solution. Building an
automated workflow appears harder than documenting it to be run manually, but
there are many benefits to reproducibility:

  - Automation facilitates repetition.
  - Automation can simplify manual documentation.
  - Automation simplifies validation of your workflow.
  - Automation streamlines sharing.
  - Automation scales to larger inputs

There are many ways to build an automated workflow. In this module we will
consider several ways of executing [pleasingly
parallel](https://en.wikipedia.org/wiki/Embarrassingly_parallel){target="_blank"}
tasks on Great Lakes:

- A serial task loop
- Parallelizing tasks using driver scripts and sbatch files.
- The SLURM Job Launcher

All these approaches execute the same workflow in different ways. The workflow
produces word pangrams. A **word pangram** is like an anagram that allows
repeating letters, e.g. the sequence of letters ACEHMNT can be rearranged to
create the pangrams ATTACHMENT, CATCHMENT, ENCHANTMENT, and ENHANCEMENT.

The workflow accepts a text file containing list of letter sequences separated
by lines; for each letter sequence it produces a file containing one or more 
pangrams.

[TODO workflow image](Module06_pangram_workflow.png)

## Pangram: A serial task loop


```bash
# Orient on project pangram
cd /nfs/turbo/umms-bioinf-wkshp/workshop/home/$USER
cd project_pangrams
ls -1
```

> ```
pangram_job_launcher
pangram_parallel_sbatch
pangram_serial_loop
README.md
    ```

```r
cd pangram_serial_loop
ls -1
```

> ```
find_pangrams.sbat
find_pangrams.sh
letters.txt
pangram.sh
README.md
  ```

Let's consider a few of these files in turn, starting with the README.

<table class='fig'><tr><th class='fig'>README.md</th></tr>
<tr><td class='fig'><pre>
# pangram_serial_loop

- Produces pangrams for inputs in letters.txt. 
  Makes one file for each line in letters.
- cgates 6/1/2024
- Usage: 
  ./find_pangrams.sh #to run locally
  or
  sbatch find_pangrams.sbat # to submit to worker node

Files:
- find_pangrams.sbat: SLURM batch file; calls find_pangrams.sh
- find_pangrams.sh: Loops throught input and calls pangram.sh
- letters.txt: list of letter sequences seperated by newlines.
- pangram.sh: accepts a single letter sequence and prints all pangrams.
</pre></td></tr></table>
<br/>
<br/>

The pangram.sh script is the workhorse of this workflow. You are welcome to look
at the implementation, but for our purposes we can treat it as a black box.
We'll run it once to see it in action.

```r
./pangram.sh lovely
```

> ```
lovely
lovey
volley
  ```


Consider the input to the workflow:

<table class='fig' width='100%'><tr><th class='fig'>letters.txt</th></tr>
<tr><td class='fig'>
```
Ndefglu
Hacilno
Tdghnou
Nailmpt
Pbegikn
Yacilrt
Achnopy
Uginoqt
Eachkmn
Alhyidn
```
</td></tr></table>
<br/>
<br/>

And finally, the script we will launch to execute the workflow:

<table class='fig' width='100%'><tr><th class='fig'>find_pangrams.sh</th></tr>
<tr><td class='fig'>
```
#/bin/bash
set -eu

for letters in $(cat letters.txt); do
    echo pangrams for: $letters >> /dev/stderr
    ./pangram.sh $letters > results.${letters}.txt
done
echo done >> /dev/stderr
```
</td></tr></table>
<br/>
<br/>

Having reviewed the inputs and scripts, we can launch the workflow like as 
shown below. (This project is called "serial loop" because in this workflow 
we are looping over the inputs and processing one at a time.)

```r
./find_pangrams.sh
```

> ```
pangrams for: Ndefglu
pangrams for: Hacilno
pangrams for: Tdghnou
pangrams for: Nailmpt
pangrams for: Pbegikn
pangrams for: Yacilrt
pangrams for: Achnopy
pangrams for: Uginoqt
pangrams for: Eachkmn
pangrams for: Alhyidn
  ```

We see the results files have been added:

```r
ls
```

> ```
find_pangrams.sbat  results.Achnopy.txt  results.Ndefglu.txt
find_pangrams.sh    results.Alhyidn.txt  results.Pbegikn.txt
letters.txt         results.Eachkmn.txt  results.Tdghnou.txt
pangram.sh          results.Hacilno.txt  results.Uginoqt.txt
README.md           results.Nailmpt.txt  results.Yacilrt.txt
  ```
  
```r
cat results.Achnopy.txt
```
> ```
cacophony
  ```

*Question: Which letter combination generated the most pangrams?*

Let's run it again but instead of using the login-node, we'll submit this to a
worker node using the provided sbat script:

```r
# first clear out the old results
rm results.*
sbatch find_pangrams.sbat 
```

> ```
Submitted batch job 1234567
  ```

Use `squeue -u $USER` to see when the job is finished and then review the 
outputs. We now see the results files and also the slurm log file:

> ```
find_pangrams.sbat   results.Alhyidn.txt  results.Tdghnou.txt
find_pangrams.sh     results.Eachkmn.txt  results.Uginoqt.txt
letters.txt          results.Hacilno.txt  results.Yacilrt.txt
pangram.sh           results.Nailmpt.txt  slurm-1234567.out
README.md            results.Ndefglu.txt
results.Achnopy.txt  results.Pbegikn.txt
```

This approach is correct, clear, and reproducible; however it's not ideal.
Consider how the tasks are contained within a job:

<table class='fig' width='100%'><tr><th class='fig'>Job/task geometry of the serial loop approach</th></tr>
<tr><td class='fig'>![TODO geometry_serial_loop](Module06_geometry_serial_loop.png)</td></tr>
<tr><td class='fig'>Each sbatch request is a job script; a job script may be
composed of multiple tasks. Key attributes of a job script are 
- what sub-tasks will I run?
- how many resources do I need?
- how long will I need to run?

You can represent these graphically by making boxes for each job and their tasks
(height = resource request and length = time). In the case above, there are many
similar tasks contained in a single job. This diagram is a rough representation
of the **job/task geometry**. This is a useful way of visualizing and comparing
approaches; also, the job geometry is critically useful information to the
scheduler which is trying to pack everyone's jobs into the available clusters as
neatly/efficiently as possible.

</td></tr></table>
<br/>

Considering that each of these pangram tasks are completely independent of each 
other (i.e. pleasingly parallel). We might be able to make better use of our ~16000 CPUs by 
parallelizing the workflow.



## Pangram: Parallel tasks

## Pangram: Job Launcher

## Reviewing job/task geometries 

## Pro tips

1. **Do not try to automate something that you cannot do by hand.**
2. **Make it right. Make it clear. Make it efficient. (In that order.)**
3. **Build a README for each workflow.** 
   Consider including:
   - Your name/email
   - The date
   - How to install the workflow
   - How to run the workflow
   - Any necessary context/constraints that would help your future collaborator
     reproduce your results.

4. **Automate the workflow with the data you have.** 
   Don't generalize a workflow too soon. You might see that a workflow could be 
   parameterized/extended to apply to new types of data. Feel that excitement, 
   note the opportunity in the README, and trust that you will make that change
   when you need to.

5. **Instead of developing the whole workflow end to end, consider an iterative and incremental approach.** <br/>
   ![](images/Module06_iterative_and_incremental.jpg)<br/>
   From [Henrik Kniberg](https://blog.crisp.se/2016/01/25/henrikkniberg/making-sense-of-mvp){target=""}
   
   Break workflow development into __at least__ three steps:
   a) do one sample and verify correctness of outputs. (For a large dataset
  consider subsetting/downsampling your inputs so you can iterate quicker.)
   b) scale to a few samples and check those outputs; tune resource allocations
   c) run the whole batch

## TODO Exercise 1

## Key ideas

* Achieving reproducible research requires a blend of documentation and automation.
* Be kind to your future self; they will thank you for the README you left them.
* Automation helps reproducibility:
  * Automation shrinks your README.
  * Automation simplifies validation of your workflow.
  * Automation enables repetition.
  * Automation streamlines sharing.
  * Automation scales to larger inputs
* Job/task geometries help visualize how different approaches are executed. (It 
also hints at the n-dimensional game of Tetris the job-scheduler is playing to
pack everyones jobs as neatly as possible.
* The **SLURM job launcher** allows you to gather many parallel tasks into a main job,
  in effect creating a transient sub-cluster within the main HPC.
* For a more complex transformation, a driver script can be either simple or
  resource efficient - choose one. Consider more robust solutions (e.g. Snakemake) as 
  necessary.


## Links and references

- UM ITS docs on [job launcher](https://arc.umich.edu/greatlakes/software/launcher/){target="_blank"}
- UM ARC [miVideo](https://www.mivideo.it.umich.edu/media/t/1_z4df84ti/181860561){target="_blank"} on advanced SLURM techniques (including job launcher, job arrays, and more)
- For more examples of pangrams in action, checkout:

  - (https://www.nytimes.com/puzzles/spelling-bee){target="_blank"}
  - (https://www.sbsolver.com/archive){target="_blank"}



| [Previous lesson](Module05_containers_docker_singularity.html) | [Top of this lesson](#top) | [Next lesson](Module07-intro-to-snakemake.html) |
| :--- | :----: | ---: |
