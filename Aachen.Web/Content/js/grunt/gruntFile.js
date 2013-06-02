// Обязательная обёртка
module.exports = function(grunt) {

    // Задачи
    grunt.initConfig({
        // Склеиваем
        concat: {
			options: {
				// define a string to put between each file in the concatenated output
				separator: ';'
			},
            desktop: {
                src: [
						'../../../Scripts/Libs/Jquery/jquery-2.0.1.js',
                        '../../../Scripts/Libs/Jquery/jquery.masonry.js',
                        '../../../Scripts/Libs/Jquery/jquery.imagesloaded.js',
                        '../../../Scripts/Libs/Bootstrap/bootstrap-collapse.js',
                        '../../../Scripts/Libs/Angular/angular.js',
                        '../../../Scripts/Libs/Angular/angular-resource.js',
                        '../../../Scripts/Libs/Angular/angular-sanitize.js',
						'../desktop/*.js'
				], //Все JS-файлы в папке
                dest: '../desktop/release/aachen-desktop.js'
            },
			mobile: {
                src: [
						'../../../Scripts/Libs/Jquery/jquery-2.0.1.js',
                        '../../../Scripts/Libs/Jquery/jquery.masonry.js',
                        '../../../Scripts/Libs/Jquery/jquery.imagesloaded.js',
                        '../../../Scripts/Libs/Bootstrap/bootstrap-collapse.js',
                        '../../../Scripts/Libs/Angular/angular.js',
                        '../../../Scripts/Libs/Angular/angular-resource.js',
                        '../../../Scripts/Libs/Angular/angular-sanitize.js',
						'../mobile/*.js'], //Все JS-файлы в папке
                dest: '../mobile/release/aachen-mobile.js'
            }
        },
        // Сжимаем
        uglify: {
            desktop: {
                files: {
                    // Результат задачи concat
                    '../desktop/release/aachen-desktop.min.js': '<%= concat.desktop.dest %>'
                }
            },
			mobile: {
                files: {
                    // Результат задачи concat
                    '../mobile/release/aachen-mobile.min.js': '<%= concat.mobile.dest %>'
                }
            }
        },
        
        
        watch: {
            desktop: {
                files: '<%= concat.desktop.src %>',
                tasks: ['concat', 'uglify']  // Можно несколько: ['lint', 'concat']
            },
			mobile: {
                files: '<%= concat.mobile.src %>',
                tasks: ['concat', 'uglify']  // Можно несколько: ['lint', 'concat']
            }
        }
    });

    // Загрузка плагинов, установленных с помощью npm install
    require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

    // Задача по умолчанию
    grunt.registerTask('default', ['concat', 'uglify', 'concat', 'watch']);
    grunt.registerTask('debug', ['concat']);
};