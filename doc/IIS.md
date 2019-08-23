
https://localhost:55539/security/tokens

            lksGlF8cEe7TxdMNfHI1UmbiXiAwBBzkZEyBiRRVb2YxyNgIYHCxTw


[Azure CLI](https://docs.microsoft.com/en-us/azure/devops/repos/git/share-your-code-in-git-cmdline?view=azure-devops)

```ps1
Install-Module -Name Az -AllowClobber
Connect-AzAccount
az extension add --name azure-devops
az login
az devops configure --defaults organization=https://dev.azure.com/andytimmons/project=VSC_md
```


```cmd
cd /home/fabrikam/fiber
git init .
git add --all
git commit -m "first commit of my code"

git remote add origin https://andytimmons@dev.azure.com/andytimmons/VSC_md/_git/VSC_md
git push -u origin --all
```
