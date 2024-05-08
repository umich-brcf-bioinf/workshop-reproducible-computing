library(rmarkdown)

# The html from the files below don't have the nav bar

# render('source/workshop_setup/preworkshop_checklist.md', output_dir='html/workshop_setup/')
# render('source/workshop_setup/setup_instructions.md', output_dir='html/workshop_setup/')
# render('source/workshop_setup/setup_instructions_advanced.md', output_dir='html/workshop_setup/')

# The html from the files below do have the nav bar, so if you make changes 
# that impact the navbar (e.g. file name changes) you should reknit all of them.

render_site('source/index.md')
render_site('source/Module00_Introduction.md')
render_site('source/Module01_Warming_Up.md')

render_site('source/Module99_Wrap_up.md')
#clean_site(preview=TRUE)
