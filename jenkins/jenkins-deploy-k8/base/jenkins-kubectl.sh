echo 'Backing up existing kubectl file'
cp ~/.kube/config ~/.kube/config_backup
echo 'Getting Jenkins service account token'
TOKENNAME=`kubectl -n kube-system get serviceaccount/jenkins -o jsonpath='{.secrets[0].name}'`
TOKEN=`kubectl -n kube-system get secret $TOKENNAME -o jsonpath='{.data.token}'| base64 --decode`
echo 'Setting up kubectl config file for Jenkins'
kubectl config set-credentials jenkins --token=$TOKEN
kubectl config set-context --current --user=jenkins
echo 'Testing Jenkins cluster access by listing namespaces'
kubectl get ns
echo 'Copying Jenkins config file to current pwd and setting correct permissions/ownership'
cp ~/.kube/config .
chmod 700 config
chown 1000:1000 config
echo 'Restoring original kubectl config'
cp ~/.kube/config_backup ~/.kube/config
echo 'Process complete. Copy config file to .kube/ in the Jenkins home volume'
