:github_url: https://github.com/Davidster/davidhuculak-dot-com/blob/master/src/experience/vehiclemind.rst

.. image:: https://hub.vehiclemind.com/img/vm%205.png

|

Vehicle Mind
============

`Vehicle Mind <https://hub.vehiclemind.com/en>`_ is a company which sells an OBD-II 
device that plugs into your car and offers some useful features and insights. This 
includes tracking their their fuel level, battery, mileage and getting human-readable 
descriptions about their engine diagnostic codes when the check engine light is visible.

I joined Vehicle Mind when it was a young and small company when I first joined in 2018 so it had the usual traits like short deadlines,
high-impact projects and each employee had a large amount of responsibility. Some of the features
I worked on include:

Core Backend
------------

Our core backend consisted of two `Spring <https://spring.io/>`_ applications using 
`DynamoDB <https://aws.amazon.com/dynamodb/features/>`_ as the database. One
was serving a REST API that was being used by our mobile application and the other was
ingesting the data from the devices using message queues and sending out push notifications
to the user.

Device Data Sandbox
-------------------

One of the tools I created at Vehicle Mind that was particularly memorable was a
small web interface that could be used to view data from the test devices that we
were using while developing the product. There wasn't much complexity to the tool.
It essentially let the user input the ID of the device, choose the device properties 
of interest, specify a date range, then view the results in a simple line graph
visualization. Despite it being so basic, it ended up being very useful for debugging
our test drives and lived on for far longer than expected.

Infra As Code
-------------

I had the pleasure of codifying our backend infrastructure using 
`Terraform <https://www.terraform.io/>`_. This task got pretty complicated due to 
the sheer number of AWS services we were using and because I was aiming for a high 
degree of automation. Doing this made it easy for a new hire to take a fresh AWS 
account and get a complete copy of our backend up and running in a matter of minutes. In addition, 
the application was moved into docker to make it platform-independent. 