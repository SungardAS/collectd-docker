

* Remove templates from this container, possibly put them in there own repo, and pull it in at runtime.  Or DynamoDB maybe.
* Currently template files for collectd plugins configs are templates, but no variables or logic in them yet(they are static), make them dynamic to be able to alter them without rebuilding the container.
* Add more plugins to the templates directory, and update whitelists accordingly.
* Create CodePipeline, and CodeBuild to autobuild and test the container.


