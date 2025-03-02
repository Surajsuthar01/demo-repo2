---
- name: Deploy httpd Docker container
  hosts: docker_host
  become: yes
  tasks:
    - name: Pull the latest httpd Docker image
      docker_image:
        name: my-httpd-image
        source: pull
        tag: latest

    - name: Stop and remove existing container
      docker_container:
        name: my-httpd-container
        state: absent

    - name: Run the httpd Docker container
      docker_container:
        name: my-httpd-container
        image: my-httpd-image:latest
        ports:
          - "80:80"
        state: started
