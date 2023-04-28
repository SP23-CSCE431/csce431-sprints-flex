# README

## Introduction

Team FLEX is working on a point tracking system for the organization Freshman Leaders Establising Excellence at Texas A&M University. The system features an easy to use point submission system where members submit requests and admins approve points. Members can also submit reimbursement requests that are also approved by admins. Admins have their own dedicated suite where they can add/remove members and approve/deny point and reimbursement requests. 

## Requirements

This code has been run and tested using the following internal and external components

Environment
•	Debian v11
•	Docker Engine v20.10.22
•	Docker container v20.10.22
•	Heroku v7.60.2
•	Nodejs v16.15.0
•	Yarn v1.22.18

Program
•	abbrev (default: 0.1.0)
•	actioncable (7.0.4.2, 7.0.3)
•	actionmailbox (7.0.4.2, 7.0.3)
•	actionmailer (7.0.4.2, 7.0.3)
•	actionpack (7.0.4.2, 7.0.3)
•	actiontext (7.0.4.2, 7.0.3)
•	actionview (7.0.4.2, 7.0.3)
•	activejob (7.0.4.2, 7.0.3)
•	activemodel (7.0.4.2, 7.0.3)
•	activerecord (7.0.4.2, 7.0.3)
•	activestorage (7.0.4.2, 7.0.3)
•	activesupport (7.0.4.2, 7.0.3)
•	addressable (2.8.1, 2.8.0)
•	ast (2.4.2)
•	base64 (default: 0.1.1)
•	bcrypt (3.1.18)
•	benchmark (default: 0.2.0)
•	bigdecimal (default: 3.1.1)
•	bindex (0.8.1)
•	bootsnap (1.16.0, 1.11.1)
•	brakeman (5.2.3)
•	builder (3.2.4)
•	bundler (2.3.14, default: 2.3.7)
•	byebug (11.1.3)
•	capybara (3.38.0, 3.37.1)
•	cgi (default: 0.3.1)
•	childprocess (4.1.0)
•	concurrent-ruby (1.2.0, 1.1.10)
•	crass (1.0.6)
•	csv (default: 3.2.2)
•	date (3.3.3, default: 3.2.2)
•	debug (1.7.1, 1.4.0)
•	delegate (default: 0.2.0)
•	devise (4.8.1)
•	did_you_mean (default: 1.6.1)
•	diff-lcs (1.5.0)
•	digest (default: 3.1.0)
•	docile (1.4.0)
•	drb (default: 2.1.0)
•	english (default: 0.7.1)
•	erb (default: 2.2.3)
•	error_highlight (default: 0.3.0)
•	erubi (1.12.0, 1.10.0)
•	etc (default: 1.3.0)
•	faker (3.1.1)
•	faraday (2.7.4)
•	faraday-net_http (3.0.2)
•	fcntl (default: 1.0.1)
•	ffi (1.15.5)
•	fiddle (default: 1.1.0)
•	fileutils (default: 1.6.0)
•	find (default: 0.1.1)
•	forwardable (default: 1.3.2)
•	getoptlong (default: 0.1.1)
•	globalid (1.1.0, 1.0.0)
•	hashie (5.0.0)
•	i18n (1.12.0, 1.10.0)
•	importmap-rails (1.1.5)
•	io-console (0.6.0, default: 0.5.11)
•	io-nonblock (default: 0.1.0)
•	io-wait (default: 0.2.1)
•	ipaddr (default: 1.2.4)
•	irb (1.6.2, default: 1.4.1)
•	jbuilder (2.11.5)
•	json (2.6.3, default: 2.6.1)
•	jwt (2.7.0)
•	listen (3.7.1)
•	logger (default: 1.5.0)
•	loofah (2.19.1, 2.18.0)
•	mail (2.8.1, 2.7.1)
•	marcel (1.0.2)
•	•	matrix (0.4.2)
•	method_source (1.0.0)
•	mini_mime (1.1.2)
•	minitest (5.17.0, 5.15.0)
•	msgpack (1.6.0, 1.5.2)
•	multi_json (1.15.0)
•	multi_xml (0.6.0)
•	mutex_m (default: 0.1.1)
•	net-ftp (0.1.3)
•	net-http (default: 0.2.0)
•	net-imap (0.3.4, 0.2.3)
•	net-pop (0.1.2, 0.1.1)
•	net-protocol (0.2.1, default: 0.1.2)
•	net-smtp (0.3.3, 0.3.1)
•	nio4r (2.5.8)
•	nkf (default: 0.1.1)
•	nokogiri (1.14.1 x86_64-linux, 1.13.6 x86_64-linux)
•	oauth2 (1.4.11)
•	observer (default: 0.1.1)
•	omniauth (1.9.2)
•	omniauth-google-oauth2 (0.8.2)
•	omniauth-oauth2 (1.7.3)
•	open-uri (default: 0.2.0)
•	open3 (default: 0.1.1)
•	openssl (default: 3.0.0)
•	optparse (default: 0.2.0)
•	orm_adapter (0.5.0)
•	ostruct (default: 0.5.2)
•	parallel (1.22.1)
•	parser (3.2.1.0, 3.1.2.0)
•	pathname (default: 0.2.0)
•	pg (1.4.5, 1.3.5)
•	power_assert (2.0.1)
•	pp (default: 0.3.0)
•	prettyprint (default: 0.1.1)
•	prime (0.1.2)
•	pstore (default: 0.1.1)
•	psych (default: 4.0.3)
•	public_suffix (5.0.1, 4.0.7)
•	puma (5.6.5, 5.6.4)
•	racc (1.6.2, default: 1.6.0)
•	rack (2.2.6.2, 2.2.3.1)
•	rack-mini-profiler (3.0.0)
•	rack-proxy (0.7.2)
•	rack-test (2.0.2, 1.1.0)
•	rails (7.0.4.2, 7.0.3)
•	rails-dom-testing (2.0.3)
•	rails-html-sanitizer (1.5.0, 1.4.2)
•	railties (7.0.4.2, 7.0.3)
•	rainbow (3.1.1)
•	rake (13.0.6)
•	rb-fsevent (0.11.1)
•	rb-inotify (0.10.1)
•	rbs (2.1.0)
•	rdoc (default: 6.4.0)
•	readline (default: 0.0.3)
•	readline-ext (default: 0.1.4)
•	regexp_parser (2.7.0, 2.5.0)
•	reline (0.3.2, default: 0.3.0)
•	resolv (default: 0.2.1)
•	resolv-replace (default: 0.1.0)
•	responders (3.1.0, 3.0.1)
•	rexml (3.2.5)
•	rinda (default: 0.1.1)
•	rspec-core (3.12.1, 3.11.0)
•	rspec-expectations (3.12.2, 3.11.0)
•	rspec-mocks (3.12.3, 3.11.1)
•	rspec-rails (6.0.1, 5.1.2)
•	rspec-support (3.12.0, 3.11.0)
•	rss (0.2.9)
•	rubocop (1.45.1, 1.30.0)
•	rubocop-ast (1.26.0, 1.18.0)
•	rubocop-capybara (2.17.0)
•	rubocop-performance (1.16.0, 1.14.0)
•	rubocop-rails (2.17.4, 2.14.2)
•	rubocop-rspec (2.18.1, 2.11.1)
•	ruby-progressbar (1.11.0)
•	ruby2_keywords (default: 0.0.5)
•	rubyzip (2.3.2)
•	sass-rails (6.0.0)
•	sassc (2.4.0)
•	sassc-rails (2.1.2)
•	securerandom (default: 0.1.1)
•	seed_dump (3.3.1)
•	selenium-webdriver (4.8.0, 4.2.0)
•	semantic_range (3.0.0)
•	set (default: 1.0.2)
•	shellwords (default: 0.1.0)
•	simplecov (0.22.0, 0.21.2)
•	simplecov-html (0.12.3)
•	simplecov_json_formatter (0.1.4)
•	singleton (default: 0.1.1)
•	spring (4.0.0)
•	sprockets (4.2.0, 4.0.3)
•	sprockets-rails (3.4.2)
•	stimulus-rails (1.2.1)
•	stringio (default: 3.0.1)
•	strscan (default: 3.0.1)
•	syslog (default: 0.1.0)
•	tempfile (default: 0.1.2)
•	test-unit (3.5.3)
•	thor (1.2.1)
•	tilt (2.0.10)
•	time (default: 0.2.0)
•	timeout (0.3.1, default: 0.2.0)
•	tmpdir (default: 0.1.2)
•	tsort (default: 0.1.0)
•	turbo-rails (1.3.3)
•	turbolinks (5.2.1)
•	turbolinks-source (5.2.0)
•	typeprof (0.21.2)
•	tzinfo (2.0.6, 2.0.4)
•	tzinfo-data (1.2022.1)
•	un (default: 0.2.0)
•	unicode-display_width (2.4.2, 2.1.0)
•	uri (default: 0.11.0)
•	warden (1.2.9)
•	weakref (default: 0.1.1)
•	web-console (4.2.0)
•	webdrivers (5.2.0, 5.0.0)
•	webpacker (5.4.3)
•	websocket (1.2.9)
•	websocket-driver (0.7.5)
•	websocket-extensions (0.1.5)
•	will_paginate (3.3.1)
•	xpath (3.2.0)
•	yaml (default: 0.2.0)
•	yaml_db (0.7.0)
•	zeitwerk (2.6.7, 2.5.4)
•	zlib (default: 2.1.1)

Tools
•	GitHub - https://github.com/SP23-CSCE431/csce431-sprints-flex
•	Jira
•	Heroku
•	Figma
•	LucidChart
•	MSTeams

## External Deps

- Docker - Download latest version at https://www.docker.com/products/docker-desktop
- Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
- Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
- GitHub Desktop (Not needed, but HELPFUL) at https://desktop.github.com/

## Documentation

Our product and sprint backlog can be found in Jira, with project name Team Flex (https://teamflex.atlassian.net/jira/software/projects/TF/settings/details)

Document
•	Data Design v3
•	UX Design v2
•	User’s Manual v4
•	UI v3

## Installation

Download this code repository by using git:

`git clone https://github.com/SP23-CSCE431/csce431-sprints-flex`

## Tests

An RSpec test suite is available and can be ran using:

`rspec spec/`

You can run all the test cases by running. This will run both the unit and integration tests.
`rspec .`

## Execute Code

Run the following code in Powershell if using windows or the terminal using Linux/Mac

`[sudo] docker pull paulinewade/csce431:latest`

`cd csce431-sprints-flex`

For windows replace $(pwd) -> ${PWD}.

`[sudo] docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 paulinewade/ruby_rails_postgresql:latest`

Install the app

`bundle install && rails webpacker:install && rails db:create && db:migrate`


Run the app
`rails server --binding:0.0.0.0`


The application can be seen using a browser and navigating to http://localhost:3000/


## Environmental Variables/Files

We have environment variables setup for Authentication. The tutorial can be found here: https://medium.com/craft-academy/encrypted-credentials-in-ruby-on-rails-9db1f36d8570

The tutorial above will help you understand now we encrypted the admin page's username and password!

Google OAuth2 support requires two keys to function as intended: Client ID and Client Secret. Set the environment variables as follows:
`$Env:GOOGLE_OAUTH_CLIENT_ID='YOUR_GOOGLE_OAUTH_CLIENT_ID_HERE'`
`$Env:GOOGLE_OAUTH_CLIENT_SECRET='YOUR_GOOGLE_OAUTH_CLIENT_SECRET_HERE'`
or
`export GOOGLE_OAUTH_CLIENT_ID='YOUR_GOOGLE_OAUTH_CLIENT_ID_HERE'`
`export $Env:GOOGLE_OAUTH_CLIENT_SECRET='YOUR_GOOGLE_OAUTH_CLIENT_SECRET_HERE'`

## Deployment

1. (Start your docker and work in your terminal) Make sure you have dev, test and main branches. 
   First, use $ git status to see if your git is tracking the current dir.
   If you haven’t created dev and test branches, please do it now. For example, commands to create a test branch with git:

![image](https://user-images.githubusercontent.com/71986659/135948039-22d70b59-03fa-4c4a-8662-b7c939c08520.png)

Note:
$ git checkout -b <branch> will create and switch to the new branch
$ git checkout <branch> will only switch to the branch
You don’t need to create a new branch in Github in advance, because $ git push origin <branch> will do it for you if Github doesn’t have a corresponding branch.

After you create all three branches, your Github should look like this:

![image](https://user-images.githubusercontent.com/71986659/135948077-9673b8ee-26ce-401b-88e7-41b7effbabed.png)

3. Switch to the test branch. Command - $ git checkout test
4. We want to run the migration on each deploy automatically.
   Create a file named Procfile in the root dir with this line of code

![image](https://user-images.githubusercontent.com/71986659/135948122-5a288ca7-b2d9-4bf3-994f-764ef745efa3.png)

5. Create a root route in config/routes.rb

![image](https://user-images.githubusercontent.com/71986659/135948148-f2db8c45-f85c-4aab-978f-4541420953bf.png)

6. Save the changes and push it to origin/test
   $ git add .
   $ git commit -m “add Procfile and route”
   $ git push origin test

7. From the Heroku Dashboard
   Click the New button in the top right of your app list and select Create new pipeline:

![image](https://user-images.githubusercontent.com/71986659/135948863-45ea06e3-0cd2-41db-9d39-d0462e25d2dd.png)

![image](https://user-images.githubusercontent.com/71986659/135948970-bc33efa7-9f34-424a-b06b-95d8cd003632.png)

Note: if there’s no app in a pipeline, the pipeline will disappear. Therefore we need to configure some apps as default.

8. Enable Review Apps. Do NOT select any options for this assignment. Click “Enable Review Apps” right away.

![image](https://user-images.githubusercontent.com/71986659/135948431-c45d21f6-5739-49d0-b7d2-34fb4f2e2b26.png)

9. Click “New app” in Review Apps. Choose the test branch. After you click “Create”, Heroku will start deploying immediately. Every time you make changes to the test branch, it triggers automatic deployment.

![image](https://user-images.githubusercontent.com/71986659/135948488-4def3e28-2aee-4743-91a1-7df18f1f5303.png)

10. We also need to create an app for staging.

![image](https://user-images.githubusercontent.com/71986659/135948509-85fbad41-a97d-4333-ac92-b2f2e7dbf431.png)

11. Click on the stage-test-app-1. Click Deploy. Choose the main branch for Automatic Deploys.

![image](https://user-images.githubusercontent.com/71986659/135948553-cca214a5-e921-4785-9b2b-2683b6f17ae2.png)

Great! You just created a pipeline ready for deployment!

12. Let’s make a small change to our app to see how Heroku pipeline works.
    You should remain in the test branch ($ git checkout test). You can be creative and change/add something that won’t break your app. For example, I add something into app/views/books/index.html.erb.
    Then save the changes and push to the remote test branch. Commands are the same as step 6.
    You’ll see that Heroku starts automatic deployment in the review app. After the deployment is done, open the app and see if it works.

![image](https://user-images.githubusercontent.com/71986659/135948581-8ed1c1be-7964-41a9-9486-0bc54cc0e735.png)

13. Next, go to the Github website. Create a pull request and merge the changes from test to main
14. After the merge, you’ll see that Heroku is automatically deploying the staging app.

![image](https://user-images.githubusercontent.com/71986659/135948604-08bf5a98-5241-4d20-9c8d-470c5d5acddb.png)

15. When the staging app is ready, open the app and check if everything looks good. Then promote it to the production area.

![image](https://user-images.githubusercontent.com/71986659/135948649-39d786e5-ed24-47e3-9dd3-38d5fd6a49a2.png)

To add enviornment variables to enable google oauth2 functionality, head over to the settings tab on the pipeline dashboard

Scroll down until `Reveal config vars`

Add both your client id and your secret id, with fields `GOOGLE_OAUTH_CLIENT_ID` and `GOOGLE_OAUTH_CLIENT_SECRET` respectively

Now once your pipeline has built the apps, select `Open app` to open the app

With the staging app, if you would like to move the app to production, click the two up and down arrows and select `Move to production`

And now your application is setup and in production mode!

## CI/CD

CI/CD has been implemented in the GitHub Actions in the repo here -> https://github.com/SP23-CSCE431/csce431-sprints-flex/actions

## Support

The support of this app has been officially closed. There is nothing more important left to develop. We can scale this app and make it generic enough for all other student orginizations and not just FLEX. Thats the future goals of this application.

## Extra Help

Please contact Liberato Aguilar (liberatoaguilar@tamu.edu), Ardian Kuswanto (ardian.kuswanto@tamu.edu), Brennan Rouhana (brennan@tamu.edu), or Jack Warham (jtw906@tamu.edu) for extra help!
