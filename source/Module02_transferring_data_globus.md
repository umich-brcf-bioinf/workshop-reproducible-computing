---
title: "Transferring Data with Globus"
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

* review storage best practices and relate them to real situations
* learn about the data transfer tool Globus
* gain real experience using Globus in various ways


## Relating Data Transfer to Storage Best Practices with Typical Examples

 - I need to retrieve raw data from a data provider, and keep it in a safe place
 - I need to copy my raw data into a new location, to perform an analysis
 - I need to share my raw data and my analysis with a collaborator

## Data Transfer

As you can see, data transfer itself is an important consideration that goes hand in hand with our storage best practices described in the previous module. Ensuring that data is transmitted and received intact, and understanding the movement and placement of data during your research life cycle is a very important aspect of reproducible computing.


## Globus

For the data transfer portion of this workshop, we'll focus on a software solution called Globus. Globus allows the transfer of data between different storage systems, and it's designed particularly for transferring research data. Many universities and institutions, including the University of Michigan, are using Globus in this way.

### What is Globus, and What it Isn't

<br>

Globus is a software suite for data transfer operations with the following characteristics:
- Fast, with parallelized transfer operations
- Resilient to connectivity problems
  - If any failures occur during transfer, ability to resume
- Fire and forget*
- Highly configurable with fine-tuned access control
- Geared towards research data, particularly where data volumes are very high

Globus is *not* a cloud storage service, in contrast with something like DropBox

![Globus vs DropBox](images/Module02_globus_vs_dropbox.png)


<br>

## Exercise Transferring Data from Data Provider to My Data Den

1 | 2
:-------------------------------------------------------------:|:-------------------------------------------------------------:
![](images/Module02_data_shared_with_me_I_transfer_1.png) | ![](images/Module02_data_shared_with_me_I_transfer_2.png)

## Exercise Transferring Data from My Data Den to My Turbo

1 | 2
:-------------------------------------------------------------:|:-------------------------------------------------------------:
![](images/Module02_data_I_transfer_between_own_storage_1.png) | ![](images/Module02_data_I_transfer_between_own_storage_2.png)


<br>
<br>

### Additional Scenarios

<details>
<summary>Sharing Data with a Collaborator</summary>

1 | 2
:-------------------------------------------------------------:|:-------------------------------------------------------------:
![](images/Module02_data_I_share_collaborator_transfers_1.png) | ![](images/Module02_data_I_share_collaborator_transfers_2.png)

</details>


<details>
<summary>Data Provider (AGC) Transfers Data to Me</summary>

1 | 2
:-------------------------------------------------------------:|:-------------------------------------------------------------:
![](images/Module02_data_I_grant_AGC_RW_AGC_transfers_1.png) | ![](images/Module02_data_I_grant_AGC_RW_AGC_transfers_2.png)

Sometimes, if we expect many data deliveries over a period of time, and if we're dealing with an entity that we can trust with write access to our storage location, it may be advantageous to set up an arrangement so that they may transfer the data to us without any action on our part. 

As shown in the figure, we can grant read **and** write access to them, and this enables them to transfer data to us without our involvement.

[link for AGC data retrieval which includes the push-to-data-den instructions](https://medresearch.umich.edu/office-research/about-office-research/biomedical-research-core-facilities/advanced-genomics-core/data-retrieval)


</details>

<br>

<details>
<summary>Collaborator Shares Data with Me</summary>

FIXME: Add section/notes about Globus Connect Personal

1 | 2
:-------------------------------------------------------------:|:-------------------------------------------------------------:
![](images/Module02_data_collab_shared_with_me_I_transfer_1.png) | ![](images/Module02_data_collab_shared_with_me_I_transfer_2.png)

</details>

<br>

FIXME: Properly place this within lesson(s) [AGC link on checking md5sum](http://michmed.org/agc-md5sum)

<br>
<br>

## Review Main Points

Must understand where the data currently resides, and where you want to transfer it

Must understand who is responsible for performing the transfer

Unless this is arranged previously for an ongoing relationship, *someone* will *always* need to grant permissions to enable a transfer between two parties


| [Back to Introduction](Module00_Introduction.html) | [Top of this lesson](#top) | [Next lesson](Module03a_sneak_peek_great_lakes.html) |
| :--- | :----: | ---: |
