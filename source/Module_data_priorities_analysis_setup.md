---
title: "Data Priorities and Analysis Setup"
author: "UM Bioinformatics Core"
output:
        html_document:
            includes:
                in_header: header.html
            theme: paper
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

In this module, we will:

* suggest priorities and overall treatment of experimental data and active analysis projects
* discuss organization practices and recommendations for anlaysis files, intermediate outputs, scripts, etc.
* utilize some of the access methods mentioned in the previous module
* use the web-based text editor for Great Lakes

<br>

### Analysis Projects

We can begin thinking of our next task - handling data and organizing files and artifacts for our analysis - by starting with the idea of the data flow described above. One of the first tasks in this area is to set up a new location for your analysis and make a copy of your raw data there.

Some considerations:

 - Fast storage, well suited for computation
 - Project organization that facilitates reproducibility
 - In-progress analyses, cleanup procedures, and end-to-end repeatable analyses

When we think about fast storage that is well suited for computation, we mostly contrast that with our long-term archival storage. A storage option is well suited for computation if it is accessible via high-throughput connection to sufficiently powerful processing hardware. The speed of reading and writing from this location can greatly affect processing times of your analysis, depending on the steps involved.

In terms of project organization, generally we want to have distinct locations for specific purposes, and preferably organizing things in a consistent manner for all of our projects.

In a particular project, you may want:

- `input_data` directory for copy of raw data
- `scripts` directory for analysis scripts
- Directories for intermediates, log files, and final outputs
- `README.txt` for the project
  - Optional `docs` directory for extensive documentation, supporting works, etc.

A useful idea for our project directory layouts is to think about the project life cycle and work towards an end-goal of a reproducible analysis. While at the beginning of an analysis many things may be flexible, at the end we will want to be able to re-execute the analysis starting from the raw input data and running all the way until it produces the final outputs.

Taking time to segregate specific efforts within a project, documenting our steps as we perform in-progress analyses, performing cleanups where needed, and similar efforts will aid us as we work towards that goal.

Think ahead when designing the layout of your projects. If you will be trying several related analysis approaches using the same input data, but intend on using results from only one of the evaluated methods, it may make sense to intentionally subdivide the contents of your project directory accordingly. If you have several distinct analyses that may use the same input data, then perhaps creating separate projects for each of them will make the most sense. It's hard to be totally prescriptive when making recommendations here, but through our example we hope to spark the kinds of conversations and the types of thinking that are required here.

![](images/Module01_projects_layout.png)

One last note on handling and organizing analysis projects - use some form of identification system for projects in your lab. This simplifies communication and record keeping, in addition to the organizational benefits.

Some ideas for project identification systems:

- Codenames
- Alphanumeric IDs

<br>

<!-- LIVE_NOTE: Ask if anyone has any preferences, or what might work best for their group and why -->

## Exercise - Organize your project

Following along with the instructor, we'll organize the files that are in our `$WORKSHOP_HOME` directory.


<br>

## Exercise - Write a README File

Following along with the instructor, we will write the beginnings of a README for our project as it exists so far.

<br>

## Review

<br>

### Handy Links

- [Link to Great Lakes Dashboard (same as above)](https://greatlakes.arc-ts.umich.edu)
- [link from AGC on validating file integrity using md5sum](http://michmed.org/agc-md5sum)


| [Previous lesson](Module_overview_and_warmup.html) | [Top of this lesson](#top) | [Next lesson](Module_compute_environment_definition.html) |
| :--- | :----: | ---: |
