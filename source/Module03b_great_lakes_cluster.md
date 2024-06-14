---
title: "Great Lakes HPC Cluster"
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

* discuss the Great Lakes HPC cluster and review its usage
* discuss software modules available on Great Lakes
* log in to the Great Lakes cluster using `ssh`
* review some of the fundamental helper commands on Great Lakes
* review SBATCH and submit jobs for our analysis

## Review of Yesterday

Very briefly, yesterday after learning about storage best practices and various storage options available to UMich researchers, we gained direct experience using these options by transferring our dataset to our own Data Den and Turbo storage locations.

<br>

We learned about a broadly-available and very generous compute package available to UMich researchers - the UMRCP - and now we'll take a few moments to briefly review that.

![](images/Module01_UMRCP_provides.png)

<br>

We also discussed HPC compute clusters managed by ARC and had some opportunities to use the Great Lakes cluster,  utilizing some of the web-based connection methods.

We talked about a pattern that may be new to us. In order to really use the HPC cluster, we had to request the appropriate resources from the system ahead of time. Let's take a few moments to briefly review our experiences there. Today we'll extend this idea.

<br>

Today we're going to discuss more in depth about additional, powerful methods for connecting to the Great Lakes cluster, requesting resources, and ultimately running jobs in a more reproducible and automatable way. We'll add more concrete detail about how this works, and gain experience through our exercises.

## Great Lakes HPC

Again, we'll provide the link to ARC's general overview page on Great Lakes here: https://arc.umich.edu/greatlakes/

![](images/Module03b_arc_site_navbar.png)

Let's not go there right now, but I'd just like to point out that there's a good deal of informational resources available on ARC's website.

<br>
<br>
<br>

### A More Detailed Look at How Great Lakes Works
![](images/Module03_cluster_overview.png)

We may have briefly mentioned the concept of a login node and a worker node when getting acquainted with Great Lakes, but we kept the explanation minimal, and only stated the fact that resources must be specified ahead of time for our tasks. With this figure we can dive a bit deeper into how this works.

<br>

### Software Modules Available on Great Lakes

For our benefit, ARC has made available a plethora of widely used and oft-requested software tools, via their module system. We may refer to this module system as LMOD. We won't cover the details of how it works<!-- LIVE_NOTE: note we will revisit this idea when comparing with other software management solutions later -->, however we'll demonstrate their usage and get a feel for using these LMOD modules on Great Lakes in our exercises.

The usage is very simple:

- `module load <name-of-module>` to enable a particular module
- `module unload <name-of-module>` to disable that module
- `module purge` to unload all modules
- `module keyword <keyword>` to search the modules for a particular keyword
- `module spider <name-of-module>` to view all versions of a particular software - many different versions may be available

We'll use these command-line methods for exploring and using LMOD modules in our exercises shortly, but it may also be helpful to later review this [link to all software modules available on various ARC HPC clusters](https://arc.umich.edu/software/).

### Exercise - Log in to Great Lakes using ssh

Following along with the instructor, we'll all log in to the Great Lakes cluster using ssh. Once there, we'll get a brief introduction to using the module system.

<br>

### Scheduled Jobs

![](images/Module03_scheduled_jobs.png)

We've taken a look into how, but now we're going to go a little deeper on the why aspect - why is the HPC cluster set up this way? 

Remember, this infrastructure must support the entire university. This means that we need a system to provide resources in a controlled, efficient, and reasonably fair way.

By having formal mechanisms for requesting resources, and utilizing a job queue and a scheduler to allocate resources and assign them to jobs, we can achieve these goals.

<!-- LIVE_NOTE: Relate the efficiency of the scheduled jobs in the figure. Idle time is minimized, while many differently-sized jobs can run simultaneously -->

<br>

### Interactive and Scripted Jobs

We've gained a little experience with some types of interactive jobs, for instance during our `RStudio` demonstration or when we verified the file integrity of our BAMs with `md5sum` using the OpenOnDemand 'Basic Desktop' app. During that exercise, we mentioned that there are other ways of doing this, which we'll introduce here.

We've just logged in using SSH to the Great Lakes HPC, and now we're all interacting with the login node. Thinking back to yesterday when we were writing the README file, we were similarly interacting with the login node.  We mentioned that we can't do anything compute-intensive here, and instead offered the OpenOnDemand apps as an alternative.

What we didn't discuss was that where we are now - on the login node - we have the ability to request resources and run jobs via the command line. These are the powerful abilities that we alluded to, and we have two ways of doing this - interactive and scripted jobs.

<!-- LIVE_NOTE: These are both examples of scheduled jobs, either way we'll request resources and use them once granted -->

<br>

### Interactive Jobs

When we speak of interactive jobs on the command line, what we really mean is that we request resources in a special way so that once they are granted, our shell will be 'sent' into a worker node, and we will be able to interact with a command-line interface that is running inside of our worker node. We'll have all of our desired resources, and we'll be able to execute our compute-intensive tasks in an interactive way.

In some of the educational material provided by ARC, a lot of times they will introduce this idea later on, or briefly mentioned as an aside. However, we want to introduce it right away, because it's very useful as a starting point, and is a great way to 'right-size' your scripted jobs, which we'll cover in a moment.

When would we want to run an interactive job?

- When we're not quite sure about the resources needed
- When we want to verify that our commands will work correctly
- When runtimes are relatively short and commands are fairly straightforward

<!-- LIVE_NOTE: Commands inside of the interactive job may lack reproducibility, we have to manually record what we do within the interactive job. -->

How do we launch an interactive job from the command line? See the example here:

```
srun --pty --job-name=${USER}_calculate_md5sum --account=bioinf_wkshp_class --partition standard --mem=2000 --cpus-per-task=1 --time=00:30:00 /bin/bash
```

<br>

### Scripted Jobs

When we talk about scripted jobs, generally we mean that inside of a file we place commands that we want to run in order - a script - along with the resource requirements.

In this case, when the resources become available, the contents of the script are executed on a worker node. There is no interaction with the running job<!--**LIVE_NOTE: Except maybe to observe it** -->. Any feedback that we'd normally receive in the terminal, can go to a log file. We'll see an example of this.

When would we want to run scripted jobs?

- When we're confident that our script/processes are correct and do what we want
- When we're confident that we are requesting adequate resources
- When we want reproducibility
- When we want scalability, we have the ability of creating many scripted jobs ahead of time, and launching them all at once

<!-- LIVE_NOTE: There are many solutions for scalability, that can leverege scripted jobs without as much upfront work. Chris will cover these tomorrow -->

What does a scripted job look like? See the dropdown section here:

<!-- LIVE_NOTE: We'll see this in just a moment, no need to look at it here -->

<details>
<summary>SBATCH example</summary>

```
#!/bin/bash
# The interpreter used to execute the script

#“#SBATCH” directives that convey submission options:

#SBATCH --job-name=Hello_SBATCH
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=400m
#SBATCH --time=00:05:00
#SBATCH --account=bioinf_wkshp_class
#SBATCH --partition=standard
#SBATCH --output=/nfs/turbo/umms-bioinf-wkshp/workshop/home/%u/sleeping_bear/logs/%x-%j.log

# The application(s) to execute along with its input arguments and options:

hostname
pwd

echo "Hello, SBATCH!"

sleep 60
```

</details>

<br>

Briefly, we place our resource requirements at the top of our file - the preamble - and then we place our scripted commands until the end of the file. Once we have our file written - our SBATCH file - we'll launch it with the command `sbatch`. For example:

`sbatch <name-of-SBATCH-file>`

We'll have a chance to try this in a moment, after we get warmed up with some interactive jobs.

>Note: We're just going to demonstrate some of the most salient bits of requesting resources. There are a lot more informational resources available at [ARC's SLURM user guide](https://arc.umich.edu/greatlakes/slurm-user-guide/).

<br>

## Exercise SBATCH Hello World

Following along with the instructor, we will inspect the `hello_SBATCH.sh` shell script that each of us have in our `$WORKSHOP_HOME` directory, review the preamble and body of it, and then submit it with `sbatch`. Once it is running, we will use `squeue` to view the status of the job. After it completes, we'll view its log.

<details>
<summary>SBATCH Hello World - Solution</summary>

`source /nfs/turbo/umms-bioinf-wkshp/workshop/home/${USER}/source_me_for_shortcut.txt`

`cd ${WORKSHOP_HOME}/project_analysis`

`sbatch ../intro_scripts/hello_SBATCH.sh`

While the job is running, check the job queue with:
`squeue -u $USER`

</details>

<br>

## Exercise `srun` with LMOD - Indexing our BAM Files

Following along with the instructor, we'll launch an interactive job with `srun`, load the samtools module, and use samtools to index our BAM files. This is a required step for some of our later processes, so we'll take care of it now. Additionally, we should do a baseline sanity check of the number of entries in each sample.

<details>
<summary>`srun` with LMOD Indexing BAMs - Solution</summary>

`srun --pty --job-name=${USER}_index_bams --account=bioinf_wkshp_class --partition standard --mem=2000 --cpus-per-task=2 --time=00:30:00 /bin/bash`

`module load Bioinformatics; module load samtools`

`for f in *.bam ; do echo $f ; samtools index $f ; done`

<!-- LIVE_NOTE: Need to do a baseline sanity check here: -->
`for f in *.bam ; do echo -n "${f}: " ; samtools view $f | wc -l ; done`

>Note: Type the command `exit` to exit from a running interactive job. This will put you back onto the log in node and free up remaining resources.

</details>

<br>

## Exercise `srun` with LMOD - Filtering our BAM Files

Following along with the instructor, we'll launch an interactive job with `srun`, load the samtools module, and use samtools to filter our sample_A BAM file to select only alignments from chromosome 19.

<details>
<summary>`srun` with LMOD Filtering BAM - Solution</summary>

`srun --pty --job-name=${USER}_filter_sample_A --account=bioinf_wkshp_class --partition standard --mem=2000 --cpus-per-task=2 --time=00:30:00 /bin/bash`

`module load Bioinformatics; module load samtools`

`mkdir filter_lmod`

`samtools view -o filter_lmod/sample_A.chr19.bam input_bams/sample_A.genome.bam 19`

>Note: We re-create this same filtered BAM file in the additional SBATCH exercises below

</details>

<br>

## Exercise SBATCH with LMOD - Filtering our BAM Files Cont'd

Following along with the instructor, we'll create an SBATCH script that is similar to our previous `srun` exercise, and use that to filter our sample_B BAM file in the same fashion. We will launch it with `sbatch` and inspect the results. If it is successful, we will continue this exercise by creating and running two more SBATCH scripts for sample_C and sample_D.

<details>
<summary>SBATCH with LMOD Filtering BAMs Cont'd - Solution</summary>

`cp ../intro_scripts/hello_SBATCH.sh scripts/filter_lmod_sample_A_sbatch.sh`

`nano scripts/filter_lmod_sample_A_sbatch.sh # Edit the file appropriately`

`sbatch scripts/filter_lmod_sample_A_sbatch.sh`

When we're happy with how sample_A turned out, we'll copy our sbatch file and set it up for sample_B etc.

`cp scripts/filter_lmod_sample_A_sbatch.sh scripts/filter_lmod_sample_B_sbatch.sh`

`nano scripts/filter_lmod_sample_B_sbatch.sh`

`sbatch scripts/filter_lmod_sample_B_sbatch.sh`

<br>

Contents of `filter_lmod_sample_A_sbatch.sh`
```
#!/bin/bash
# The interpreter used to execute the script

#“#SBATCH” directives that convey submission options:

#SBATCH --job-name=Filter_sample_A
#SBATCH --cpus-per-task=2
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=2000m
#SBATCH --time=00:20:00
#SBATCH --account=bioinf_wkshp_class
#SBATCH --partition=standard
#SBATCH --output=/nfs/turbo/umms-bioinf-wkshp/workshop/home/%u/project_analysis/logs/%x-%j.log

# The application(s) to execute along with its input arguments and options:

hostname
pwd

module load Bioinformatics
module load samtools
samtools view -o filter_lmod/sample_A.chr19.bam input_bams/sample_A.genome.bam 19
```

</details>

<br>

<!-- LIVE_NOTE: We would like to also visualize our samples, we know that we can use `bamCoverage` from the `deeptools package, however it's not available as an LMOD module. -->

<!-- LIVE_NOTE: Make sure we unload samtools module! -->

>Note: Make sure to unload the samtools module, so that it does not interfere with the conda exercises in the next section!

---


| [Previous lesson](Module03a_sneak_peek_great_lakes.html) | [Top of this lesson](#top) | [Next lesson](Module04_software_management_conda.html) |
| :--- | :----: | ---: |
