# flask
flask test

this is an explanation of how to run the flask app 
the main app is in app.py

the Dockerfile contains the prerequisits to installing the app with the environment variable

the app was installed in openshift 4.6 and all the yamls that require to run the app are included in this repo


as for the method i choose to expose the service is was with the build in solution wgich openshift provides that is an ingress(route)
i choose it because as the current way of kubernetes the way of exposing using ingress as a http/https requests while behind the db is not expose to the world only to the services inside kubernetes for security
as my app is a frontend app and it only requires http to access the solution of route was ideal for me

the other sulotion there was were nodeport which i expose the port of a service and can access only with nodeip:nodeport and is good for a testing but not production
and loadbalancer that expose the service to a remote loadbalancer which balances between the nodes that was exposed this solution can be used in applications that require tcp requests 

