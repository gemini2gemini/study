'use strict';
var path = require('path');
var lrSnippet = require('grunt-contrib-livereload/lib/utils').livereloadSnippet;

var folderMount = function folderMount(connect, point) {
  return connect.static(path.resolve(point));
};


module.exports = function(grunt) {

  var pkg = grunt.file.readJSON('package.json');

  grunt.initConfig({
    connect: {
      livereload: {
        options: {
          port: 9001,
          middleware: function(connect, options) {
            return [lrSnippet, folderMount(connect, '.')]
          }
        }
      }
    },
    cssmin: {
      compress: {
        files: {
          './min.css': ['css/base.css', 'css/style.css']
        }
      }
    },
    watch: {
      files: ['css/*.css'],
      tasks: ['cssmin']
    },
    // Configuration to be run (and then tested)
    regarde: {
      fred: {
        files: '*.html',
        tasks: ['livereload']
      }
    }
    
  });

  var taskName;
  for(taskName in pkg.devDependencies) {
    if(taskName.substring(0, 6) == 'grunt-') {
      grunt.loadNpmTasks(taskName);
    }
  }


  grunt.registerTask('default', ['cssmin', 'watch']);
  grunt.registerTask('default', ['livereload-start', 'connect', 'regarde']);
};
