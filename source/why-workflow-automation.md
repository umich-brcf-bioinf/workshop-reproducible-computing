---
title: "Why workflow automation?"
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

By the end of this introduction, we will:

* understand what workflow automation is and how it helps reproducibility
* consider different ways that transformations can scale
* list a few of the workflow automation approaches

## Header 1

## Header 2

## Review

* Be kind to your future self; they will thank you for the README you left them.
* Workflow automation helps reproducibility because
  * It simplifies your README
  * It can be easier to validate computational correctness
  * It's easier to re-execute if you make changes
  * For complex transforms, it's easier for someone else to execute
  * It gracefully scales to larger inputs
* Some transformations are "tall" i.e. a series of chained transformations on 
  a single input. Some transformations are "wide" i.e. a simple transform 
  applied to many inputs. (Some are both.)


| [Back to Introduction](Module00_Introduction.html) | [Top of this lesson](#top) | [Next lesson](Module FIXME .html) |
| :--- | :----: | ---: |
