---
title: "Software Management and Conda"
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

* learn about software management
* discuss package managers
* discuss conda as a software management solution
* learn how to set up conda
* learn how to create and use our own conda environments

## Software Management

Software management is something that is not typically appreciated until it is missing. In your typical day-to-day computing tasks, software management is an automatic background process, and generally this is how we want things to be.

When performing research computing tasks, however, you may run into situations when this automatic background handling of software requirements is not sufficient. You may have very specific version requirements, or you may have disparate (or incompatible!) software needs for different tasks.

You'll find that the tools that we employ for software management during research computing have some extra capabilities that make them particularly well-suited for these use cases.

### Package Managers

We likely all have some experience with software management. I'd like to examine our experience with software management, and promote appreciation for the work that often happens behind the scenes.

<br>

![](images/Module04_dependencies_long_list.png)

<br>

![](images/Module04_dependencies_xsdk_tangled_mess.png)

<br>

### The Need for Modular Solutions

System-level software

Just one env

Poll about software incompatibility experiences


## Conda

- Broad support for many types of software packages
  - Across languages and platforms
- Plugable - Ability to switch between software environments at will
- Automatically handles software requirements
- A 'Conda recipe' is used to list specifications
  - Used during environment creation
  - Can communicate requirements to others when shared

### Simplifies Distribution of New Software

Cutting edge software - cutting edge dependencies

Ability to record recipe and share

If I'm developing a package, I can take these simple steps - ensures everyone can use software


### Environments

The thing that is 'built' by Conda and can be enabled/disabled at will

Actual terms `activate` and `deactivate` used in conda

Within the environment, dependencies are handled, software is made available

Quick aside about $PATH


### Packages and Channels

We start to care about these when we are creating our own conda environments

Packages - a bunch of files (binaries, config files, etc), all bundled up together

Conda will download various packages as described, and has a system for storing these packages and "installing" them in an particular location

"Install" is air-quoted - although the software is installed, it differs from a typical software installation in that everything within the package is contained in a special location set by Conda


### Anaconda vs Miniconda

Anaconda comes pre-bundled with a plethora of common python and data science packages. Miniconda starts out as more of a blank slate.

### Conda configuration with .condarc

Condarc file contains configuration details for your conda installation. 

https://conda.io/projects/conda/en/latest/user-guide/configuration/use-condarc.html

Specific recommendation: use `envs_dirs` to place conda envs and downloaded packages into an appropriate location

## Conda Install and Configure Exercise

Following along with instructor, learners will install miniconda and create a `.condarc` file

## Conda Activate Exercise

Following along with instructor, learners will activate an existing environment. We'll demonstrate addition to the $PATH (and `which`?)

## Conda Create Exercise

Instructor will demonstrate creating a simple conda environment on the command line. 

We'll then ask about how to create a slightly more complicated conda environment. We'll start a thread and learners will respond and/or vote on the command that they would use

## SRUN with Conda Create Exercise

Following along with instructor, we'll launch an srun job and then create a conda environment in it

## SBATCH with Conda Activate Exercise

Individual exercise. Launch an SBATCH job that activates a conda environment, checks a version of samtools and uses `which` to verify its location. Inspect the job log in order to determine success

## Conda Export Exercise

Following along with the instructor, we'll use Conda's export functionality to create an export - a more complete recipe with all dependencies and their versions fully listed.

FIXME: Allude to the idea of time-based durability


## Review

Conda allows us to install and manage our own software. On a multi-user system like Great Lakes, this is very powerful. 

It provides plugability to our software needs. When we need a wide variety of tools at different times, with some being incompatible with one another, this becomes critical.

When given a set of software requirement specifications, Conda handles all of the dependencies and creates a somewhat contained environment that we can `activate` and `deactivate` as needed.

| [Previous lesson](Module03b_great_lakes_cluster.html) | [Top of this lesson](#top) | [Next lesson](Module05_containers_docker_singularity.html) |
| :--- | :----: | ---: |
