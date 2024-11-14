---
title: "Wrap up"
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
            code_download: false
---

<style type="text/css">

body, td {
   font-size: 18px;
}
code.r{
  font-size: 12px;
}
pre {
  font-size: 12px
}

</style>

We hope you now have more familiarity with key patterns, approaches, and tools
that can enable more computational reproducibility in your research. Please remember that reproducibility exists on a continuum:

![Advanced Reproducibility in Cancer Informatics / The Johns Hopkins Data Science Lab
](images/Module99_continuum.png){target="_blank"}
Sourced from [Advanced Reproducibility in Cancer Informatics](https://jhudatascience.org/Adv_Reproducibility_in_Cancer_Informatics/index.html){target="_blank"} / The Johns Hopkins Data Science Lab
---

## Housekeeping

- Please take our optional [post-workshop survey](https://forms.gle/rmV7J3MURWFeWGSc6){target="_blank"}. (5-10 minutes)

- We will email you a link to the final session recordings by end of next week.

- The website/notes for this workshop will be available.

- The UM Bioinformatics Core [Workshop Slack](https://umbioinfcoreworkshops.slack.com){target="_blank"} content will be available
  for 90 days.

---

## Looking ahead

#### Workshop environment
- This Great Lakes account will will be available to you until 12/15/2024. 
  Following that, you will be removed this account and any content inside the 
  workshop Turbo or DataDen will be removed.
- You can download files from your workshop home dir using your terminal/command line window as below. 
  (You will need to substitute your actual uniqname and type your password when prompted.)
  ```
  mkdir computational-reproducibility-workshop
  cd computational-reproducibility-workshop
  scp -r greatlakes-xfer.arc-ts.umich.edu:/nfs/turbo/umms-bioinf-wkshp/workshop/home/YOUR_USERNAME .
  ```
Please keep in mind that this workshop environment is optimized for the
exercises in this partcular workshop but is likely unsuitable for analyzing
your own datasets. In particular:

- It is not sized for compute intensive operations or large storage.
- It is not secured for sensitive data of any kind.

## Continued learning and support

Making research reproducible is a learning process.

### UM resources

- [UM CoderSpaces](https://datascience.isr.umich.edu/events/coderspaces/){target="_blank"} office hours and Slack workspace.
- Great Lakes [user guide](https://documentation.its.umich.edu/arc-hpc/greatlakes/user-guide){target="_blank"}.
- Great Lakes [cheatsheet](https://docs.google.com/document/d/1wsr3yzkkojUMBCCneCz-l413xBzU-SZFAqcFrAAjttk/edit?tab=t.0#heading=h.kquo6lavnl0f){target="_blank"}.
- Upcoming [UM Advanced Research Computing workshops](https://ttc.iss.lsa.umich.edu/ttc/sessions/tag/arc/){target="_blank"}.
- Videos on [getting started with Great Lakes](https://www.mivideo.it.umich.edu/channel/ARC-TS%2BTraining/181860561/){target="_blank"}.
  

### External resources

- Lessons and workshops in Bash / Git / R / Python : [Software Carpentry](https://software-carpentry.org/lessons/){target="_blank"} 
  and the [UM Software Carpentry Group](https://umcarpentries.org/){target="_blank"}.
- [Advanced Reproducibility in Cancer Informatics](https://jhudatascience.org/Adv_Reproducibility_in_Cancer_Informatics/index.html){target="_blank"} from The Johns Hopkins Data Science Lab.
- Alston et al. 2020. A Beginner's Guide to Conducting Reproducible Research. Bull Ecol Soc Am 102(2):e01801. https://doi.org/10.1002/bes2.1801 .
- Essawy et al.A taxonomy for reproducible and replicable research in environmental modelling, Environmental Modelling & Software, Volume 134, 2020, https://doi.org/10.1016/j.envsoft.2020.104753 .
- [Guide to Reproducibility in Science](https://ropensci-archive.github.io/reproducibility-guide/){target="_blank"}.

---

## Thank you

![Sponsors](images/intro/sponsor_logos.png)

## Thank you to/from the workshop team
| ![](images/headshots/headshot_cgates.jpg) | ![](images/headshots/headshot_mbradenb.jpg) | ![](images/headshots/headshot_trsaari.jpg) |
|:-:|:-:|:-:|:-:|
| **Chris** | **Marci** | **Travis** |
| ![](images/headshots/headshot_damki.jpg) | ![](images/headshots/headshot_rcavalca.jpg) | ![](images/headshots/headshot_clairis.jpg) | 
| **Dana** | **Raymond** | **Clair** | 

<br/>


Thank you for participating in our workshop. We welcome your questions and feedback now and in the future.

Bioinformatics Workshop Team

[bioinformatics-workshops@umich.edu](mailto:bioinformatics-workshops@umich.edu) <br/>
[Bioinformatics Core](https://medresearch.umich.edu/office-research/about-office-research/biomedical-research-core-facilities/bioinformatics-core){target="_blank"}
