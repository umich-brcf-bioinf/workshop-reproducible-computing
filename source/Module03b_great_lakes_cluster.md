---
title: "Great Lakes HPC Cluster"
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

In this module, we will:

* discuss the Great Lakes HPC cluster and review its usage
* discuss software modules available on Great Lakes
* review SBATCH and submit jobs for our analysis

## Review - UMRCP and the Components We'll Use in This Workshop

![](images/Module01_UMRCP_provides.jpg)

UMRCP provides compute hours on the Great Lakes and/or Armis clusters, fast "Turbo" storage, slower tape-based "Data Den" storage, and a "Secure Enclave" RAM allocation. In this workshop, we'll be primarily using the Great Lakes cluster and the Turbo storage allocations.


## Great Lakes HPC

https://arc.umich.edu/greatlakes/

https://arc.umich.edu/greatlakes/slurm-user-guide/

![](images/Module03_cluster_overview.png)

### Scheduled Jobs

![](images/Module03_scheduled_jobs.png)



### Interactive Jobs

```
srun --pty --job-name=FIXME --account=FIXME --partition standard --mem=4000 --cpus-per-task=2 --time=00:30:00 /bin/bash
```

### LMOD Modules

https://arc.umich.edu/software/


### SBATCH

```
#!/bin/bash
# The interpreter used to execute the script

#“#SBATCH” directives that convey submission options:

#SBATCH --job-name=Hello_world
#SBATCH --mail-user=trsaari@umich.edu
#SBATCH --mail-type=END
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=400m
#SBATCH --time=00:05:00
#SBATCH --account=FIXME
#SBATCH --partition=standard
#SBATCH --output=/home/%u/SBATCH/logs/%x-%j.log

# The application(s) to execute along with its input arguments and options:

hostname
pwd

echo "Hello, world!"

sleep 60
```

## Exercise SBATCH Hello World


## Exercise `srun` with LMOD


## Exercise SBATCH with LMOD




| [Back to Introduction](Module00_Introduction.html) | [Top of this lesson](#top) | [Next lesson](Module FIXME .html) |
| :--- | :----: | ---: |
