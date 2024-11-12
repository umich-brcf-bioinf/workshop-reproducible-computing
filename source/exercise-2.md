---
title: "Independent Exercise - SBATCH, Dialog Parsing, & Word Clouds - Proper Nouns"
author: "UM Bioinformatics Core"
output:
        html_document:
            includes:
                in_header: header.html
            theme: paper
            fig_caption: true
            markdown: GFM
            code_download: false
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

## SBATCH, Dialog Parsing, & Word Clouds - Proper Nouns

<br>

**15 Minutes**

<br>

We just proved out our alcott_dialog_parsing project with a number of `srun` commands. We also gained additional practice creating SBATCH script files and submitting them using `sbatch`.

Let's use what we've learned and revisit our analysis - this time extracting and visualizing proper nouns used by each of the characters.

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

- Create an SBATCH file that uses `singularity exec` to run our `dialog_parser.py` script, this time extracting proper nouns from each character.
  - Pay attention to SBATCH preamble (job name, resources, log file location).
- Submit the above SBATCH file, view the output, and verify that we have word lists containing proper nouns in our results directory.
- Create an SBATCH file that creates a word cloud from one of the characters' extracted proper nouns.
- Submit that SBATCH file, view the output exists, and view the image in the Great Lakes file browser as well.
- Create similar SBATCH files for all other characters and submit them.
- View all of the result images in the Great Lakes file browser.

<br>

[Link to Great Lakes Dashboard](https://greatlakes.arc-ts.umich.edu)

<br>
