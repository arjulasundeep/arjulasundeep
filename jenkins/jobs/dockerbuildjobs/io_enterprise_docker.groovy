def jobname = 'io-enterprise-docker'

multibranchPipelineJob(jobname) {
    description ('Maven Build and Upload of offical artifact as defined in project pom.xml file')
    
    triggers{
        bitBucketMultibranchTrigger {
                overrideUrl('https://bitbucket.org/simeioio/' + jobname + '.git')
        }
    }
    
    branchSources {
        git {
            id(jobname)
            remote('https://bitbucket.org/simeioio/' + jobname + '.git')
            credentialsId('bitbucket-jenkins')
            includes("master develop")
        }
    }
}
