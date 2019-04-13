pipeline {
    agent none
    stages {
	    stage("ubuntu") {
	        agent {
	            docker {
	                image 'ubuntu'
	                label 'docker'
	            }
	        }
            steps {
		        sh './setup.sh'
	        }
	    }
	    stage("fedora") {
	        agent {
	            docker {
	                image 'fedora'
	                label 'docker'
	            }
	        }
            steps {
		        sh './setup.sh'
	        }
	    }
	    stage("arch") {
	        agent {
	            docker {
	                image 'archlinux/base'
	                label 'docker'
	            }
	        }
            steps {
		        sh './setup.sh'
	        }
	    }
    }
}

