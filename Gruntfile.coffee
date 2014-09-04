module.exports = (grunt) ->

  require('load-grunt-tasks')(grunt)

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    coffeelint:
      src: 'src/coffee/*.coffee'
      test: 'test/src/*.coffee'

    jasmine:
      default:
        src: ['js/*.js']
        options:
          keepRunner: false
          outfile: 'test/spec_runner.html'
          specs: 'test/spec/*.spec.js'

    coffee:
      src:
        options:
          bare: true
        expand: true
        flatten: true
        cwd: 'coffee'
        src: ['*.coffee']
        dest: 'js/'
        ext: '.js'
      test:
        expand: true
        flatten: true
        cwd: 'test/src'
        src: ['*.coffee']
        dest: 'test/spec/'
        ext: '.spec.js'

    watch:
      options:
        atBegin: true
      src:
        files: ['coffee/*.coffee']
        tasks: ['coffeelint:src', 'coffee:src', 'jasmine']
      test:
        files: ['test/src/*.coffee']
        tasks: ['coffeelint:test', 'coffee:test', 'jasmine']

    bump:
      options:
        files: [
          'package.json'
          'bower.json'
        ]
        updateConfigs: ['pkg']
        commitFiles: ['-a']


  grunt.registerTask 'build', [
    'coffeelint'
    'coffee'
    'jasmine'
  ]

  grunt.registerTask 'default', [
    'watch'
  ]
