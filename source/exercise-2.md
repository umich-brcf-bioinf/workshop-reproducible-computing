---
title: "Independent Exercise - SBATCH, Conda, Filtering our BAMs"
author: "UM Bioinformatics Core"
output:
        html_document:
            includes:
                in_header: header.html
            theme: paper
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

<br>

## Filtering All Samples

<br>

**15 Minutes**

<br>

We just learned how to activate an existing conda environment and use it to provide software that we want - `samtools` - and use samtools to filter our BAM files. We also recently learned how to create SBATCH script files and submit them using `sbatch`.

Let's combine these ideas and filter the rest of our BAM files. 

If you have extra time, there's a bonus exercise of indexing your BAMs as well

<br>

### Instructions:

<br>

- Work independently in the main room, posting any questions that arise to slack.
- Recommendations for writing your own code:
  - Read function documentation
  - Test out ideas - it's okay to make mistakes and generate errors
  - Use a search engine to look up errors or recommended solutions using keywords
- We'll review possible solutions after time is up as a group.

<br>

- Review our samtools command that we used earlier. Combine this with what we've learned about using conda environments and creating SBATCH files.
- Create an SBATCH file that activates our `samtools_deeptools` conda environment. With the conda environment active, use `samtools` to filter sample_A.
- Submit the SBATCH file, view the output, and verify once it's complete that we have created the filtered sample_A BAM file.
- Once we are happy with the results, create additional SBATCH files for our other samples, and submit them as well.

<br>

>Bonus: If you have extra time, extend this exercise and use `samtools index` to index the filtered BAM file for sample_A.

<br>
