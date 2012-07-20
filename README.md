# Trackman

Trackman is a Heroku add-on that enables you to handle your maintenance and error pages with the rest of your app and hosts the production version of those files in the cloud when you deploy.

* It works with rails-like conventions.
* It is rack-based.
* It will push your pages and all their internal assets upon application initialization. 

## Information

### Platform support

Trackman works out of the box for Ruby(1.8.7 and 1.9.3) on

* Rails 2
* Rails 3


## Getting started
### Step 1 - Install the heroku add-on
```console
heroku addons:add trackman
```
### Step 2 - Add the gem to your Gemfile
```console
gem 'trackman'
```

##### Step 2.1 - Rails 2 only
```console
./script/generate trackman
```
This will add trackman.rake to lib/tasks/ 

### Step 3 - Setup
```console
rake trackman:setup
```
This sets your initial heroku configurations and ensures that when your app is down or in maintenance your pages will be requested by heroku.
If you have maintenance or error pages setup for heroku, we will back them up in a configuration before we override them.  

### Optional - If for any reason you wish to troubleshoot the sync operation:

```console
heroku run rake trackman:sync
```
Calling this command manually will throw exceptions instead of silently failing like the normal sync would.

### For best results, make sure you have those installed:
* Heroku >= 2.26.2
* Bundler >= 1.1.3

### Notes
By convention, we assume your maintenance page is located at

```console
public/503.html
```

If you want two different pages for maintenance and when your app is down, we expect:

For maintenance
```console
public/503.html
```
Broken app
```console
public/503-error.html
```

After the add-on installation

* On the first publish or manual sync, your html file(s) and every internal assets referenced by your pages(s) will be pushed to the server so that we can store them properly on S3.
* On the next publications, only modified assets will be published. 
* Any renamed or missing asset will be handled properly.

### Bug reports

Any bug report can be submitted here.
https://github.com/SynApps/trackman/issues


### Creators / Maintainers

* Jeremy Fabre (https://github.com/jfabre)
* Emanuel Petre (https://github.com/epetre)

###Copyright

Copyright © 2012 Emanuel Petre, Jeremy Fabre

## License

  Trackman is released under the MIT license:

  [LICENSE](https://github.com/jfabre/trackman/blob/master/LICENSE)

