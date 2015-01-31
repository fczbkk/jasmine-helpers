module.exports = (grunt) ->

  require('load-grunt-tasks')(grunt)

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    coffeelint:
      src: 'src/coffee/*.coffee'
      test: 'test/src/*.coffee'

    jasmine:
      default:
        src: ['helpers/*.js']
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
        cwd: 'src/coffee'
        src: ['*.coffee']
        dest: 'helpers/'
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
        files: ['src/coffee/*.coffee']
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
        pushTo: 'origin'

    changelog:
      options: {}
    
  grunt.registerTask 'dev', [
    'coffeelint'
    'coffee'
    'jasmine'
  ]

  # Constructs the code, runs tests and if everyting is OK, creates a minified
  # version ready for production. This task is intended to be run manually.
  grunt.registerTask 'build', 'Bumps version and builds JS.', (version_type) ->
    version_type = 'patch' unless version_type in ['patch', 'minor', 'major']
    grunt.task.run [
      "bump-only:#{version_type}"
      'dev'
      'changelog'
      'bump-commit'
    ]

  grunt.registerTask 'default', [
    'watch'
  ]
