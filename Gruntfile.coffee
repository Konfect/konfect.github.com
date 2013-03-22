module.exports = (grunt) ->

	grunt.initConfig

		bootstrap:
			dest: 'scripts/bootstrap'
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
				'utilities.less'
				#'responsive-utilities.less'
				#'responsive-767px-max.less'
			]

		less:
			app:
				files: 
					'lib/style.min.css': [
						'scripts/bootstrap/css/bootstrap.css'
						'scripts/app.less'
					]
				options:
					compress: true

		watch:
			less:
				files: ['scripts/less/app.less']
				tasks: ['less']

		connect:
			app:
				options:
					keepalive: true

	grunt.registerTask 'default', ['bootstrap', 'less']

	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-connect'
	grunt.loadNpmTasks 'grunt-bootstrap'

	grunt.registerTask 'gitploy', 'Deploy to GitHub Pages', ->
		paths = ['lib', 'index.html']
		Git = require 'git-wrapper'
		git = new Git()
		done = @async()
		git.exec 'checkout gh-pages', (err) ->
			throw err if err?
			git.exec 'checkout master -- ' + paths.join(' '), (err) ->
				throw err if err?
				git.exec 'commit -am "updates from master"', (err) ->
					throw err if err?
					git.exec 'push origin gh-pages', (err) ->
						throw err if err?
						git.exec 'checkout master', (err) ->
							throw err if err?
							done()
