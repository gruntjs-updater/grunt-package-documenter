# grunt-package-documenter
# https://github.com/adamliechty/grunt-package-documenter
#
# Copyright (c) 2015 Adam Liechty
# Licensed under the MIT license.
#

'use strict'

module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    jshint:
      all: [
        'Gruntfile.js'
        'tasks/*.js'
        '<%= nodeunit.tests %>'
      ]
      options:
        jshintrc: '.jshintrc'

    # Before generating any new files, remove any previously-created files.
    clean:
      tests: ['tmp']

    # Configuration to be run (and then tested).
    package_documenter:
      options:
        output: 'tmp/out.md'

    # Unit tests.
    nodeunit:
      tests: ['test/*_test.js']

  # Actually load this plugin's task(s).
  grunt.loadTasks 'tasks'

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks('grunt-contrib-jshint')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-nodeunit')

  # Whenever the "test" task is run, first clean the "tmp" dir, then run this
  # plugin's task(s), then test the result.
  grunt.registerTask('test', ['clean', 'package_documenter', 'nodeunit'])

  # By default, lint and run all tests.
  grunt.registerTask('default', ['jshint', 'test'])
