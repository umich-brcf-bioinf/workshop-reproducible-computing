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
* Introduce the notion of "pleasingly parallel" transformations
* Make a "driver script" to execute a "wide" automation
* Define the notion of a workflow resource footprint
* Understand the advantage of "job launcher" and use it to execute "wide" automation
* Make a driver script to execute "tall" automation
* Understand the limitations of a simple driver script.

## Header 1

## Header 2

### Pro tips

1. Do not try to automate something that you cannot do by hand.
2. Make it right. Make it clear. Make it efficient. (In that order.)
3. Scale up incrementally; take at least three steps and don't be afraid to take more:
   a) do one sample and verify correctness of outputs. (For a large dataset
  consider starting with subsetted input dataset so you can iterate quicker.)
   b) scale to a few samples and check those outputs; tune resource allocations
   c) run the whole batch

## TODO Exercise 1

## Key ideas

* A driver script is a straightforward approach to simple transformation across
  a small to moderate number of samples with a low resource footprint.
* The job launcher allows you to gather many parallel tasks into a main job,
  in effect creating a transient sub-cluster within the main HPC.
* For a more complex transformation, a driver script can either be simple or
  resource efficient. Consider more robust solutions (e.g. Snakemake) as 
  necessary.

| [Back to Introduction](Module00_Introduction.html) | [Top of this lesson](#top) | [Next lesson](Module FIXME .html) |
| :--- | :----: | ---: |
