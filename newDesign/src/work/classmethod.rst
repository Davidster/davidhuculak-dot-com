:github_url: https://github.com/Davidster/davidhuculak-dot-com/blob/master/src/experience/classmethod.rst

.. image:: https://borderless-career.com/wp-content/uploads/2021/09/tate_color_black.png

|

Classmethod
===========

`Classmethod Canada <https://www.classmethod.ca/>`_, the Canadian division of `Classmethod Japan <https://classmethod.jp/>`_ is a
tech support and consulting company I worked at in 2018 and 2019. They focus on clients who have some tech infrastructure and are using 
or are interested in migrating to the AWS cloud. They provide consulting with respect to migration, billing,
security, scaling and reliability. Some of the projects I worked on at Classmethod were:

Twitter Sentiment Analysis
--------------------------

In order to showcase the types of AWS-related services we could provide, we made a proof of concept 
project that marked the sentiment of a large set of tweets and visualized the results. To do this we 
obtained a large number of tweets from a dataset from `kaggle.com <https://www.kaggle.com/>`_, loaded them into an AWS-hosted
database, then ran a highly parallel batch process which detected the sentiment of each of them using
`AWS Comprehend <https://aws.amazon.com/comprehend/>`_ and aggregated the results into a store that 
could be understood and visualized by `Kibana <https://www.elastic.co/kibana/>`_. We also built a demo
that did the same thing but using a real Twitter account, which was able to scrape all the tweets from the
account and repeat the same process.

Xpress Yrself 
-------------

This was a customer feedback terminal that consisted of a terminal with a few buttons on it that 
customers in a physical store could click in order to rate their experience. I had the pleasure
of working on each piece of this project from end to end, including the onboard computer set up (Debian),
bluetooth button pairing, printer integration through an sdk written in C, the cloud backend
that ingested and stored the data from the terminals, and a real-time visualization web application
which consisted of a set of embedded Tableau graphs as well as a floor plan + notification
system indicating where a button had been clicked every time it happened.

AWS Certification
-----------------

While I was working at Classmethod, we had weekly study meetings where one of the senior members
mentored us on the various AWS services. Eventually, I was given the chance to take the 
`AWS Certified Developer – Associate <https://aws.amazon.com/certification/certified-developer-associate/>`_,
exam. I was able to pass the exam thanks to the study meetings as well as the AWS-focused 
day to day work that I had been doing for the company.