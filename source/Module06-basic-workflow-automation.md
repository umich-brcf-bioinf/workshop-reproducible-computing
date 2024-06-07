---
title: "Basic workflow automation"
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
* Understand what workflow automation is and how it helps reproducibility.
* Consider different ways that workflows can scale.
* Introduce the notion of "pleasingly parallel" transformations
* Make a "driver script" to execute a "wide" automation
* Define the notion of a workflow resource footprint
* Understand the advantage of "job launcher" and use it to execute "wide" automation
* Make a driver script to execute "tall" automation
* Understand the limitations of a simple driver script.

## Header 1

## Header 2

### Pro tips

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
4. **Develop incrementally.**
   Break workflow development into __at least__ three steps:
   a) do one sample and verify correctness of outputs. (For a large dataset
  consider starting with subsetted input dataset so you can iterate quicker.)
   b) scale to a few samples and check those outputs; tune resource allocations
   c) run the whole batch
5. **Automate the workflow with the data you have.** 
   Don't generalize a workflow too soon. You might see that a workflow could be 
   parameterized/extended to apply to new types of data. Feel that excitement, 
   note the opportunity in the README, and trust that you will make that change
   when you need to.

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
* Some transformations are "tall" i.e. a series of chained transformations on 
  a single input. Some transformations are "wide" i.e. a simple transform 
  applied to many inputs. And some are both.
* A driver script is a straightforward approach to simple transformation across
  a small to moderate number of samples with a low resource footprint.
* The **SLURM job launcher** allows you to gather many parallel tasks into a main job,
  in effect creating a transient sub-cluster within the main HPC.
* For a more complex transformation, a driver script can be either simple or
  resource efficient - choose one. Consider more robust solutions (e.g. Snakemake) as 
  necessary.

| [Previous lesson](Module05_containers_docker_singularity.html) | [Top of this lesson](#top) | [Next lesson](Module07-intro-to-snakemake.html) |
| :--- | :----: | ---: |
