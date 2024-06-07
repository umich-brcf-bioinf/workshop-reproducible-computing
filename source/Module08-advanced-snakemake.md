---
title: "Advanced Snakemake"
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
* Call a shell script from a Snakefile
* Understand how to fine-tune resource allocations like CPUs, memory, time
* Understand how to use conda/singularity in workflows
* Use a profile run a Snakemake workflow using SLURM/GreatLakes
* Connect to a specifc login-node and use `tmux` to simplify long-running
  Snakemake jobs
* Review best practices for organizing a Snakemake workflow

## Header 1

## Header 2


## Key ideas

* TODO
* Be a good neighbor


Exercise 1:
consider the profile config: alcott_snakemake/config/profile/config.yaml
Look up the meaning of TODO in the snakemake doc:

Choose another config entry that you don't understand and review the correspoinding doc 

Exercise 2A:
cd to the project publication_snakemake_2
Fill in the missing parts of this Snakefile so it matches the supplied DAG figure.
OK to confirm it runs on the login-node.

Exercise 2B:
Make a profile config and run this on the Great Lakes cluster worker nodes. (You can copy the config from alcott_snakemake/config/profile/config.yaml.)

Exercise 3C: 
Rearrange the Snakefile so that rules
live in their own files in a new `rules` directory and are imported to the 
Snakefile.

Exercise 4D:
In rule TODO, replace the module loads with a container directive to specify a singularity instance for the analysis rules.
TODO directive text



| [Back to Introduction](Module00_Introduction.html) | [Top of this lesson](#top) | [Next lesson](Module FIXME .html) |
| :--- | :----: | ---: |
