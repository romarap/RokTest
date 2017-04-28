/// <binding BeforeBuild='default' Clean='clean' />
"use strict";
const gulp = require('gulp');
const runSequence = require('run-sequence');
const readable = require('stream').Readable;


const user = 'rokudev';
const pass =  'developer';
const applicationName = 'All 4';
const packagePath = "dist/";
const packageName = "package.zip"
const contentId = "8-out-of-10-cats|52899-003"; //"inside-jaguar-making-a-million-pound-car|60689-001"; //young-hungry|65098-008"; //"8-out-of-10-cats|52899-003"; // 
const nowTvDeepLink = "brand=8-out-of-10-cats&programme=52899-005";//"brand=inside-jaguar-making-a-million-pound-car";//"brand=8-out-of-10-cats&programme=52899-003"; 
var ipAddress = "192.168.1.179";//"10.63.120.78" ;//"192.168.1.66";//172.20.10.4";//"10.63.120.122" ;//"192.168.1.133";//"192.168.1.133"; //"192.168.1.133"; //"192.168.1.133";//"10.63.120.111" ;
//telnet�192.168.1.129�8085
//telnet�192.168.1.129�8089


var app = process.env.app;
var env = process.env.environment;
 

gulp.task('default', function () {
    runSequence('commandLine',
              ['kill', 'clean'],
              'package',
              'deploy'
              );
});

//Process commandline - extracting all commandline variables
gulp.task('commandLine', function () {
	var argv = require('yargs')
    .usage('Usage: $0 [options]')
    .example('$0 -i 10.63.120.132 -a app -e env')
    .alias('i', 'ipaddress')
    .nargs('i', 1)
    .describe('i', 'Roku IP Address')
	.default('i', ipAddress)
	.alias('a', 'app')
    .nargs('a', 1)
    .describe('a', 'app')
	.default('app', app)
	.alias('e', 'env')
    .nargs('e', 1)
    .describe('e', 'Environment')
	.default('e', env)
    //.demand(0, ['i'])
	.demand(0, [])
    .help('h')
    .alias('h', 'help')
    .argv;
	
	ipAddress = argv.ipaddress;
    
	app = argv.app;
	env = argv.env;

	console.log("--->" + ipAddress + " " + app + " " + env);
});

//--
gulp.task('package', function () {
	var zip = require('gulp-zip');
	
    return gulp.src([
				'./manifest',      // manifest
				'./*{,/**}',
				// Excludes - for reference if we need to do any excludes
				'!dist{,/**}',
				'!node_modules{,/**}',
				'!gulpfile.js',
				'!package.json',
				'!*.sln'])
        .pipe(zip(packageName))
        .pipe(gulp.dest(packagePath));
});



//-- calls the exit twice
gulp.task('kill', function () {
    var request = require('request');
    var delay = require('delay');

    console.log("closing app");
    request.post({ url: 'http://' + ipAddress + ':8060/keypress/home' }, function optionalCallback(err, httpResponse, body) {
        if (err) {
            return console.error('kill failed:', err);
        }
        // No error in posting
        console.log("Deploy returned status: " + httpResponse.statusCode);
        
        console.log("second call to kill");
        request.post({ url: 'http://' + ipAddress + ':8060/keypress/home' }, function optionalCallback(err, httpResponse, body) {
            if (err) {
                return console.error('kill failed:', err);
            }
            // No error in posting
            console.log("Deploy returned status: " + httpResponse.statusCode);
           
        })
    })
})



//--
gulp.task('deploy', function () {
	var request = require('request');
	var fs = require('fs');
	
	var formData = {
		'mysubmit': 'install',
		// Pass package via Streams
		'archive': fs.createReadStream(__dirname + "/" + packagePath + packageName)
	};
	request.post({url:'http://' + ipAddress + '/plugin_install', 'auth': {
		'user': user,
		'pass': pass,
		'sendImmediately': false
		},
		formData: formData}, function optionalCallback(err, httpResponse, body) {
			if (err) {
				return console.error('upload failed:', err);
			}
			// No error in posting
			if (httpResponse.statusCode == 200)
            {

                // Determine what the "Application Received:" status is by looking in body - just display first occurrance
                var rs = new readable;
                var count = 0;
                rs.push(body);
                rs.push(null);
                
                var readline = require('linebyline'),
                    rl = readline(rs);
                    count = 0;
                rl.on('line', function(line, lineCount, byteCount) {
                    var index = line.indexOf("Application Received:");
                    if(index > -1 & count === 0) {
                        count ++;
                        if (line.indexOf("not replacing") > -1)
                        {
                            console.log(line.substring(index));
                            lookupInstalledApplicationVersion();
                        }
                        else
                        {
                            lookupInstalledApplicationVersion();
                        }
                    }
                })
                .on('error', function(e) {
                    // something went wrong
                    console.log("ERROR :: " + e);
                });
            }
            else
            {
                console.log("ERROR :: Deploy received a " + httpResponse.statusCode);
            }
		});
});

//--
gulp.task('clean', function () {
	var clean = require('gulp-clean');
	
    return gulp.src(packagePath, {read: false})
        .pipe(clean());
});

//--
gulp.task('run', function () {
    var request = require('request');
    var fs = require('fs');

    request.post({
        url: 'http://' + ipAddress + ':8060/launch/dev'
    }, function optionalCallback(err, httpResponse, body) {
        if (err) {
            return console.error('Launch Failed:', err);
        }
        // No error in posting
        console.log("Run returned status: " + httpResponse.statusCode);

    });
});

//--
gulp.task('test', function () {
    var request = require('request');
    var fs = require('fs');
    
    request.post({
        url: 'http://' + ipAddress + ':8060/launch/dev?RunTests=true'
    }, function optionalCallback(err, httpResponse, body) {
        if (err) {
            return console.error('Launch Failed:', err);
        }
        // No error in posting
        console.log("Test returned status: " + httpResponse.statusCode);

    });
});

gulp.task('deeplink', function () {
    var request = require('request');
    var fs = require('fs');
    
    request.post({
        url: 'http://' + ipAddress + ':8060/launch/dev?contentID=' + contentId 
    }, function optionalCallback(err, httpResponse, body) {
        if (err) {
            return console.error('Launch Failed:', err);
        }
        // No error in posting
        console.log("Test returned status: " + httpResponse.statusCode);

    });
});

gulp.task('nowtvdeeplink', function () {
    var request = require('request');
    var fs = require('fs');
    
    request.post({
        url: 'http://' + ipAddress + ':8060/launch/dev?' + nowTvDeepLink 
    }, function optionalCallback(err, httpResponse, body) {
        if (err) {
            return console.error('Launch Failed:', err);
        }
        // No error in posting
        console.log("Test returned status: " + httpResponse.statusCode);

    });
});

gulp.task('installed', function () {
   lookupInstalledApplicationVersion();
});


gulp.task('autoTest2', function () {
    
    var wait  = require('gulp-wait');
    var connection = StartCapturingOutput();

    SendKey ("Down");
    SendKey ("Down");
    SendKey ("Down");
    SendKey ("Down");
    SendKey ("Down");
    SendKey ("Down");
    SendKey ("Down");
    SendKey ("Up");
    SendKey ("Up");
    SendKey ("Up");
    SendKey ("Up");
    SendKey ("Up");
    wait(5);
    SendKey ("Right");
    wait(1);
    SendKey ("Right");
    SendKey ("Select");
    //connection.end();

});

gulp.task('monitorFree', function () {
    
    var telnet = require('telnet-client');
    var connection = new telnet();
    
    var params = {
        host: ipAddress,
        port: 8080,
        timeout: 1500,
        shellPrompt: '#'//,
        //debug: true
    };
    
    connection.on('ready', function(prompt) {
        console.log("ready");
 
    });

    connection.on('timeout', function() {
        //console.log('socket timeout!')
    });

    connection.on('connect', function() {
        console.log('socket connect!')
        connection.send("free");
        connection.send("free");
        //connection.exec("free");
        
        //    .then(function(res) {
        //        console.log('promises result:', res)
        //    });
    });

    connection.on('data', function(buffer) {
        console.log(">" + buffer);
        //connection.send("free");
       //var index = buffer.indexOf("Omniture: Tracking");
       //  if(index > -1) {
       //     console.log("ISSUE::" + buffer);
        //}
     });

    connection.on('failedlogin', function() {
        console.log('socket failedlogin!')
    });


    connection.on('error', function() {
        console.log('socket error!')
    });
 
    connection.on('close', function() {
        console.log('connection closed');
    });
    
    connection.connect(params);
    //return connection;

    

});

function StartCapturingOutput() {
    var telnet = require('telnet-client');
    var connection = new telnet();
    
    var params = {
        host: ipAddress,
        port: 8085,
        timeout: 5000,
        shellPrompt: '#',
        debug: true
    };
    
    connection.on('ready', function(prompt) {
        //console.log("ready");
 
    });

    connection.on('timeout', function() {
        //console.log('socket timeout!')
    });

    connection.on('connect', function() {
        //console.log('socket connect!')
    });

    connection.on('data', function(buffer) {
       var index = buffer.indexOf("Omniture: Tracking");
         if(index > -1) {
            console.log("ISSUE::" + buffer);
        }
     });

    connection.on('failedlogin', function() {
        //console.log('socket failedlogin!')
    });


    connection.on('error', function() {
        console.log('socket error!')
    });
 
    connection.on('close', function() {
        console.log('connection closed');
    });
    
    connection.connect(params);
    return connection;
}

function SendKey(key) {
    var request = require('request');

    request.post({ url: 'http://' + ipAddress + ':8060/keypress/' + key }, function optionalCallback(err, httpResponse, body) {
            
            // No error in posting
            console.log("status: " + httpResponse.statusCode);
           
        })
}

function lookupInstalledApplicationVersion() {
   var request = require('request');
   var cheerio = require('cheerio');

    request({ url: 'http://' + ipAddress + ':8060/query/apps'}, function optionalCallback(err, httpResponse, body) {
            var version;
            // Use cheerio to parse the xml and extract the version number
            var $ = cheerio.load(body, { xmlMode: true });
            $('app').each(function(i, elem) {
                if ($(this).text() == applicationName)
                {
                    version = $(this).attr('version')
                }
            });
            if (version == null)
            {
                console.log("ERROR :: Application " + applicationName + " not found. Check logs for details");
            }
            else
            {
                console.log(version);
            }
        })
}


gulp.task('autoTest', function () {
    var wait  = require('gulp-wait');
    var script = {
        actions : [
            {key : "Down", delay : 2000},
            {key : "Down", delay : 2000},
            {key : "Down", delay : 2000},
            {key : "Down", delay : 2000},
            {key : "Down", delay : 2000},
            {key : "Down", delay : 2000},
            {key : "Down", delay : 2000},
            {key : "Up", delay : 2000},
            {key : "Up", delay : 2000},
            {key : "Up", delay : 2000},
            {key : "Up", delay : 2000},
            {key : "Up", delay : 5000},
            {key : "Right", delay : 2000},
            {key : "Right", delay : 2000},
            {key : "Select", delay : 2000}
            
        ]
    };
    runScriptAction(script.actions,0)
});


function runScriptAction(actions,index) {
    SendKey(actions[index].key);
    if (index < actions.length-1)
    {
        var delay = 0;
        if (actions[index].delay != null)
        {
            delay = actions[index].delay;
        }
        var timer = setTimeout(function () {
            runScriptAction(actions,index+1);
        }, delay);
    }
}





