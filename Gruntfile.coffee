module.exports = (grunt) ->

	grunt.initConfig

		bootstrap:
			dest: '_scripts/bootstrap'
			js: []
			css: [
				'reset.less'
				'mixins.less'
				'scaffolding.less'
				'grid.less'
				'layouts.less'
				'type.less'
				'forms.less'
				'buttons.less'
				#'navs.less'
				#'navbar.less'
				#'thumbnails.less'
				#'media.less'
				#'wells.less'
				'utilities.less'
				'responsive-utilities.less'
				'responsive-767px-max.less'
				'responsive-768px-979px.less'
				#'responsive-1200px-min.less'
				#'responsive-navbar.less'
			]

		less:
			app:
				files:
					'_tmp/style.min.css': [
						'_scripts/bootstrap/css/bootstrap.css'
						'_scripts/app.less'
					]
				options:
					compress: true
					yuicompress: true

		uncss:
			app:
				files: '_tmp/style.min.css': '_scripts/index.html'

		cssmin:
			app:
				files: '_tmp/style.min.css': '_tmp/style.min.css'

		htmlbuild:
			app:
				src: '_scripts/index.html'
				dest: '_tmp/'
				options:
					styles:
						all: '_tmp/style.min.css'

		htmlmin:
			options:
				removeComments: true
				collapseWhitespace: true
				collapseBooleanAttributes: true
			app:
				files:
					'index.html': '_tmp/index.html'

  grunt.registerTask 'default', ['less', 'uncss', 'cssmin', 'htmlbuild', 'htmlmin']
  #grunt.registerTask 'default', ['less', 'htmlbuild', 'htmlmin']

  grunt.loadNpmTasks 'grunt-bootstrap'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-html-build'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-uncss'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
