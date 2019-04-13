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
		        sh 'command -v amethyst || exit 1'
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
		        sh 'command -v amethyst || exit 1'
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
		        sh 'command -v amethyst || exit 1'
	        }
	    }
    }
}

