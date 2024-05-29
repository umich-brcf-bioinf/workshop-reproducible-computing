library(rmarkdown)

# The html from the files below don't have the nav bar

render('source/workshop_setup/preworkshop_checklist.md', output_dir='html/workshop_setup/')
render('source/workshop_setup/setup_instructions.md', output_dir='html/workshop_setup/')
# render('source/workshop_setup/setup_instructions_advanced.md', output_dir='html/workshop_setup/')

# The html from the files below do have the nav bar, so if you make changes 
# that impact the navbar (e.g. file name changes) you should reknit all of them.

render_site('source/index.md')
render_site('source/Module00_Introduction.md')

render_site('source/Module01_storage_best_practices_UMRCP.md')
render_site('source/Module02_transferring_data_globus.md')
render_site('source/Module03a_sneak_peek_great_lakes.md')
render_site('source/Module03b_great_lakes_cluster.md')
render_site('source/Module04_software_management_conda.md')
render_site('source/Module05_containers_docker_singularity.md')

render_site('source/Module99_Wrap_up.md')
#clean_site(preview=TRUE)
