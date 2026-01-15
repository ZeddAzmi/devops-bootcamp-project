## Architecture Design

- Infrastructure provisioned using Terraform
- Private subnet hosts Ansible Controller and Monitoring Server
- Web Server exposed via Elastic IP
- Monitoring exposed only via Cloudflare Tunnel
- All inter-service communication uses private IPs
