def jobname = 'ioenterprise'

multibranchPipelineJob(jobname) {
    description ('Builds maven job')
    
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
            includes("master development")
        }
    }
}
