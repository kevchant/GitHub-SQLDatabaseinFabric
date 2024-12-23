Contains a template that you can use to perform CI/CD for Microsoft Fabric Data Warehouses using GitHub Actions in two different ways. Based on a blog post I wrote called '[Two ways to perform CI/CD for SQL databases in Fabric using GitHub Actions](https://www.kevinrchant.com/2024/12/23/two-ways-to-perform-ci-cd-for-sql-databases-in-fabric-using-github-actions/)'.

Both methods use a workflow, which you can find in the [.github/workflows](https://github.com/kevchant/GitHub-FabricDWDBProject/tree/main/.github/workflows) subfolder.

In order to use it in GitHub you can either clone or fork this repository into another GitHub repository.

Afterwards, you can select the workflow file in GitHub and tailor the workflow to suit your needs.

You MUST have the below secret specified for the [SQLDBinFabricExtractSchematoDacpac.yml](https://github.com/kevchant/GH-SQLDatabaseinFabric/blob/main/.github/workflows/SQLDBinFabricExtractSchematoDacpac.yml) workflow to work:
* SOURCEDB_CONNECTION_STRING - Connection string to connect to the source SQL database in Fabric

You MUST have the below secret specified for either workflow to work:
* DESTINATIONDB_CONNECTION_STRING - Connection string to connect to the destination SQL database in Fabric.

You can change the workflow, but advise not to hard code in any sensitive details.

You can find an alternative for two ways to perform CI/CD for Two ways to perform CI/CD for SQL databases in Fabric using YAML Pipelines in Azure DevOps in my '[AzureDevOps-SQLDatabaseinFabric](https://github.com/kevchant/AzureDevOps-SQLDatabaseinFabric)' repository. 

This repository is provided "as is" based on the [MIT license](https://opensource.org/licenses/MIT). Basically, I am not responsible for your use of it.
