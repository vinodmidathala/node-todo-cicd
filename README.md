# Project
Containerize and deploy a node.js application using Jenkins Job.

### 🔹Step 1
**Fork the repo** - https://github.com/Aishwarya-Portfolio/node-todo-cicd

### 🔹Step 2
**Create a connection to your Jenkins job and your GitHub Repository via GitHub Integration.**

We can use SSH keys or PAT tokens to integrate the GitHub repo into Jenkins.

Here I am using SSH keys.

1. Generate SSH key pair in your Jenkins instance.
> ssh-keygen

I already have the key pair.

![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/535a92f9-e4b3-4df0-950b-46636d62150b)

2. Create a new SSH key in GitHub and save the public key of Jenkins Instance.
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/65ee0fc2-9675-495b-8734-32ef197e1ec1)
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/56454e3d-6529-4e43-a559-fd630ac4556c)

3. Save the Private key in the Jenkins credential.
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/b2117c84-bbf9-4f0c-bbb0-f74569e864c0)
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/aff79845-83a6-4af3-8879-930ebd057f10)

4. Create a new Freestyle Jenkins Job -
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/fd56a28c-5807-40d8-b547-5a3b3d7e7595)

5. Add source code GitHub Repo with added credential -
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/7728a83e-1297-49d3-bfcb-147c39e7b139)

6. Now run the pipeline to check if the source code is checked out through Jenkins -
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/4aab0360-7f4a-47a0-ac12-8d074a3d9a32)

The repo files are present in Jenkins Workspace -
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/377bcf27-5c05-46d8-b4ba-e9e54ab2b0e7)

7. Now we need to set up a webhook for an automatic trigger from GitHub.
-- Install the GitHub integration plugin in Jenkins.
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/27dda5ed-249b-4244-bd74-c64c7f6ad362)

-- Create a Webhook.

The payload URL should be in the below format
> http://jenkins_URL/github-webhook/

![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/dc3780b4-18a9-4792-9122-e61d414d54a5)

8. Do not forget to open port 8080 to Anywhere so that the GitHub webhook can reach Jenkins on port 8080.

The green tick shows that the connection is established.
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/a9c3d058-c994-44c0-96fc-d95d603cf218)

9. In your Jenkins Job, enable GitHub Hook to trigger in the build trigger section.
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/ab1c5b87-3a24-43e0-9938-e9a1dd6498d2)

10. To test the webhook, make some changes to the code and commit it.

Check if a push event triggered the Job.
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/84647105-7502-44e6-af40-3f530271dfc0)

### 🔹Step 3
**In the Execute shell run the application using Docker compose.**
1. Create a Dockerfile to install all the dependencies and containerize the application.
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/7baaad93-6c71-4c5f-bdd8-e94cc48f8970)

2. Add a build step - Execute shell to build the docker image.
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/54cfa9c6-f4a2-4666-ba09-7ffe48595232)

3. Docker image is created successfully.
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/5dac6177-1898-400f-9ed7-ea8808982969)
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/1e1549e7-6856-43ea-8df6-bada566a5b42)

4. Create a docker-compose file to run the container using this image.
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/9e4ca77f-cbec-45cd-b861-dc10f5dce6ed)

5. Add the docker-compose up command to run the container.
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/b62010e0-a1d9-4049-9bff-146b4c277088)

6. The build is successful.
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/2c4cc437-4b13-4828-8d4e-db4f0d156cf6)

7. The container is up and running.
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/79e5418f-8192-4601-956e-4c790a40c944)

8. Since I want to run the application on Port 8100, I made changes in the app.js file.
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/19b66e05-85d6-40d9-94ca-7cc627fbde6b)

9. Now my application is running.
![image](https://github.com/Aishwarya-Portfolio/node-todo-cicd/assets/91592578/bee98cd7-234c-436b-8971-038f3b0b853c)


