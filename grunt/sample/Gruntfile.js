module.exports = function(grunt) {

  var pkg = grunt.file.readJSON('package.json');

  grunt.initConfig({
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
    }
  });

  var taskName;
  for(taskName in pkg.devDependencies) {
    if(taskName.substring(0, 6) == 'grunt-') {
      grunt.loadNpmTasks(taskName);
    }
  }


  grunt.registerTask('default', ['cssmin', 'watch']);
};
