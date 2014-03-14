
module.exports = function(grunt) {

    //config //設定情報は、以下の中に書く
	grunt.initConfig({

        //gruntで出力するファイルに package.jsonの情報を取得するために必要な記述
        pkg: grunt.file.readJSON('package.json'),



        /*configの書き方
        task: {
        	//全てのtargetに対して有効にするには、この位置に書く
        	options: {

        	}
	        target: { //targetはtaskをグループ化したもの//target名は何でも良い
                //optionを特定のtargetにのみ有効にするには、targetの中に書く
                options: {

                },
                設定(src): .....,
                設定(dest): .....
	        },
	        target: { //targetはtaskをグループ化したもの
                設定:
	        }
        }
        */


        /* src,destの書き方

        task: {
	        target: {
	            src: .....,
	            dest: ....
	        }
        }

        or

        task: {
	        target: {
	            files: {
	                dest: src
	            }
	        }
        }

        */

		//sassの処理
		sass: {
			build1: {
				// options指定(sassの出力圧縮)
                //options: {
                //    style: 'compressed' //sass 出力圧縮 //concatは無いので main.sassに@importする
                //},
				//元ファイル
				src: 'src/style1.sass',
				//目的地ファイル
				dest: 'build/style1.css'

				//  src,dest と同じ内容になるfilesの書き方
				// files: {
	            //    'build/style1.css': 'src/style1.sass'
				// }

				//複数のファイルを一つにしたい場合は、配列も使用できる //sassの場合は統合できないので意味が無い
				// files: {
			    //     'build/style.css': ['src/style1.sass', 'src/style2.sass']
				// }

				//ワイルドカードも使用可能  *などで全て指定
				// files: {
			    //     'build/style.css': 'src/*.sass'
				// }

				//ワイルドカードも使用可能  srcの下に複数のフォルダがあり、そのフォルダ内のファイル全ての場合は以下のように記述できる
				// files: {
			    //     'build/style.css': 'src/**/*.sass'
				// }

			}
			// },
			// build2: {
			// 	//元ファイル
			// 	src: 'src/style2.sass',
			// 	//目的地ファイル
			// 	dest: 'build/style2.css'
			// }
		},
        csslint: {
            check: {
            	// csslintは　srcのみでOK
                //src: 'build/style1.css'

                //以下のように記述する事も可能 下記 = 'build/style1.css'
                src: '<%= sass.build1.dest %>'
            }
        },
        cssmin: {
        	minimize: {
        		options: {
        		    //ファイルの先頭にメッセージを入れるoption
                    banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */'
        	    },
        		files: {
        			'build/style.min.css': '<%= sass.build1.dest %>'
        		}
        	}
        },
        watch: {
        	//target 省略
            // livereloadをするため、htmlにscript埋め込み
        	options: {
        		livereload: true
        	},
        	files: 'src/*.sass',  //watchしたいファイル
        	tasks: ['sass', 'csslint', 'cssmin'] //変更があったときに行いたい処理
        },
        connect: {
            //localhost:8000 で確認
		    use_defaults: {

		    }
        }
	});

    //plugin //pluginは、以下の中に書く
    grunt.loadNpmTasks('grunt-contrib-sass');//sassのプラグインロード
    grunt.loadNpmTasks('grunt-contrib-csslint');//csslintのプラグインロード
    grunt.loadNpmTasks('grunt-contrib-cssmin');//cssminのプラグインロード
    grunt.loadNpmTasks('grunt-contrib-connect');//connectのプラグインロード
    grunt.loadNpmTasks('grunt-contrib-watch');// watchのプラグインロード



    //tasks //処理は、以下の中に書く
    //タスクは、配列で記述することで複数指定できる、また指定した順番に処理するので、記述順序には気をつける
    grunt.registerTask('default', ['sass', 'csslint', 'cssmin', 'connect', 'watch']);//gurntをdefaultというoptionで立ち上げると sassなどがconfig の設定で実行される
    //grunt.registerTask('task1', 'sass:build1');//default以外の記述は、gruntコマンドの後ろに付ければ良い、targetごとに処理する場合は、task名の後ろに:target名をつける
    //grunt.registerTask('task2', 'sass:build2');


};
