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
					'lib/style.min.css': [
						'_scripts/bootstrap/css/bootstrap.css'
						'_scripts/app.less'
					]
				options:
					compress: true

		watch:
			less:
				files: ['_scripts/app.less']
				tasks: ['less']

		connect:
			app:
				options:
					keepalive: true

	#grunt.registerTask 'default', ['bootstrap', 'less']

	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-connect'
	grunt.loadNpmTasks 'grunt-bootstrap'
