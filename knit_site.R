library(rmarkdown)
# The html from the files below don't have the nav bar

render('source/workshop_setup/preworkshop_checklist.md', output_dir='html/workshop_setup/')
render('source/workshop_setup/setup_instructions.md', output_dir='html/workshop_setup/')

# The html from the files below do have the nav bar, so if you make changes 
# that impact the navbar (e.g. file name changes) you should reknit all of them.

render_site('source/index.md')
render_site('source/Module00_Introduction.md')

render_site('source/exercise-2.md')

render_site('source/Module_overview_and_warmup.md')
render_site('source/Module_sneak_peek_great_lakes.md')
render_site('source/Module_data_priorities_analysis_setup.md')
render_site('source/Module_compute_environment_definition.md')
render_site('source/Module_storage_best_practices_UMRCP.md')
render_site('source/Module_great_lakes_cluster.md')
render_site('source/Module_software_management_conda.md')
render_site('source/Module_containers_docker_singularity.md')
render_site('source/Module_intro_to_workflow_automation.md')
render_site('source/Module_intro_to_snakemake.md')
render_site('source/Module_advanced_snakemake.md')
render_site('source/Module_raw_data_management.md')
render_site('source/Module_transferring_data_globus.md')

render_site('source/Module_wrap_up.md')
#clean_site(preview=TRUE)
