---
title: "Reproducible Computing Workshop"
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

a.external {
    background: url(images/external-link.png) center right no-repeat;
    padding-right: 13px;
}
</style>

## Wrapping up

We hope you now have more familiarity with key patterns, approaches, and tools
that can enable more computational reproducibility in your research. Please remember that reproducibility exists on a continuum:

![Advanced Reproducibility in Cancer Informatics / The Johns Hopkins Data Science Lab
](images/Module99_continuum.png){target="_blank"}
Sourced from [Advanced Reproducibility in Cancer Informatics](https://jhudatascience.org/Adv_Reproducibility_in_Cancer_Informatics/index.html){target="_blank"} / The Johns Hopkins Data Science Lab
---

## Housekeeping

- Please take our optional [post-workshop survey](https://forms.gle/spsxWoyceGG2VxBG9){target="_blank"}. (5-10 minutes)

- We will email you a link to the final session recordings by end of next week.

- The website/notes for this workshop will be available.

- The <a class="external" href="https://umbioinfcoreworkshops.slack.com" target="_blank">UM Bioinformatics Core Workshop Slack channel</a> will be available
for 90 days.

---

## Looking ahead

#### Workshop environment
- This Great Lakes account will will be available to you until 6/30/24. 
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
exercises in this particular workshop but is likely unsuitable for analyzing
your own datasets. In particular:

- It is not sized for compute intensive operations or large storage.
- It is not secured for sensitive data of any kind.

## University of Michigan Resources


#### Continued learning and support
Making research reproducibile is a learning process. Resources to consider:

- <a class="external"  href="https://datascience.isr.umich.edu/events/coderspaces/" target="_blank">UM CoderSpaces "office hours"</a> and UM CoderSpaces Slack workspace. _(See "Useful Resources" section in above page for instructions on how to join and access the CoderSpaces Slack workspace.)_
- Upcoming <a class="external" href="https://arc.umich.edu/events/" target="_blank">UM Advanced Research Computing workshops</a>.
- Videos on <a class="external" href="https://www.mivideo.it.umich.edu/channel/ARC-TS%2BTraining/181860561/" target="_blank">getting started with Great Lakes</a>.
- For more intro lessons and workshops in Bash / Git / R / Python : <a href="https://software-carpentry.org/lessons/" target="_blank">Software Carpentry</a> and the <a href="https://umcarpentries.org/" target="_blank">UM Software Carpentry Group</a>.
- [Advanced Reproducibility in Cancer Informatics](https://jhudatascience.org/Adv_Reproducibility_in_Cancer_Informatics/index.html) {target="_blank"} from The Johns Hopkins Data Science Lab

---

## Thank you

![Sponsors](images/Module00_sponsor_logos.png)

## Thank you to/from the workshop team
| ![](images/Module00_headshots/headshot_cgates.jpg) | ![](images/Module00_headshots/headshot_mbradenb.jpg) | ![](images/Module00_headshots/headshot_trsaari.jpg) |
|:-:|:-:|:-:|:-:|
| **Chris** | **Marci** | **Travis** |
| ![](images/Module00_headshots/headshot_damki.jpg) | ![](images/Module00_headshots/headshot_rcavalca.jpg)
| **Dana** | **Raymond** |

<br/>


Thank you for participating in our workshop. We welcome your questions and feedback now and in the future.

Bioinformatics Workshop Team

[bioinformatics-workshops@umich.edu](mailto:bioinformatics-workshops@umich.edu) <br/>
[https://medresearch.umich.edu/office-research/about-office-research/biomedical-research-core-facilities/bioinformatics-core](https://medresearch.umich.edu/office-research/about-office-research/biomedical-research-core-facilities/bioinformatics-core){target="_blank"}
