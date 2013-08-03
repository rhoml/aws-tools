aws-tools
=========

This are all the tools you need to manage your AWS public cloud from the command line.

Make sure to modify the **JAVA_HOME** variable before using it. It's actually hardcoded for OSX Mountain Lion.

I'll try to keep the tools up to date. If not, feel free to Contribute ;)

Assumptions
============
For this repository I assume that you already have this directory tree.
<pre>
~/.ec2
   |---- aws-credential-ES
   |---- cert-ES.pem
   |---- pk-ES.pem
</pre>

### File Description

* aws-credential-ES: AWS Credentials as shown in aws-credential.template [AWS CREDENTIALS] [CREDENTIALS]
* cert-ES.pem: Cert x.509 Amazon certificate [AWS CREDENTIALS] [CREDENTIALS] Download it and Rename.
* pk-ES.pem: PK x.509 Amazon certificate [AWS CREDENTIALS] [CREDENTIALS] Download it and Rename.

Setup
======

* Clone the repository into your ~/.ec2/aws-tools directory
* Modify your .bashrc or .bash_profile adding this lines

<pre>
if [ -f ~/.ec2/aws-tools/.bash_aws ]; then
    . ~/.ec2/aws-tools/.bash_aws
fi
</pre>

Contributing
============
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Command Line Tool URL's
========================
[Autoscaling](http://aws.amazon.com/developertools/2535)

[Cloudwatch](http://aws.amazon.com/developertools/2534)

[EC2 AMI](http://aws.amazon.com/developertools/368)

[EC2 API](http://aws.amazon.com/developertools/351)

[ElasticBeanstalk](http://aws.amazon.com/code/6752709412171743)

[Elastic load Balancing](http://aws.amazon.com/developertools/2536)

[IAM](http://aws.amazon.com/developertools/AWS-Identity-and-Access-Management/4143)

[RDS](http://aws.amazon.com/developertools/2928)


LICENSE:
========
Copyright (c) 2007-2009 RightScale, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[CREDENTIALS]: https://aws-portal.amazon.com/gp/aws/developer/account/index.html?action=access-key
