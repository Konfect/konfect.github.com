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

		watch:
			less:
				files: ['_scripts/app.less']
				tasks: ['less']

		connect:
			app:
				options:
					keepalive: true

	grunt.registerTask 'default', ['less', 'htmlbuild', 'htmlmin']

	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-connect'
	grunt.loadNpmTasks 'grunt-bootstrap'
	grunt.loadNpmTasks 'grunt-contrib-htmlmin'
	grunt.loadNpmTasks 'grunt-html-build'
