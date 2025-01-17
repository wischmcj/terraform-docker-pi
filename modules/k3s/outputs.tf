output "kubeconfig" {
  sensitive = true
  value = { for kubeconfig in values(data.remote_file.kubeconfig)
  : kubeconfig.conn[0].host => replace(kubeconfig.content, "192.168.0.94", kubeconfig.conn[0].host) }
}

# output "kubeconfiglocal" {
#   sensitive = true
#   value = { for kubeconfig in values(data.remote_file.kubeconfig)
#   : kubeconfig.conn[0].host => replace(kubeconfig.content, "127.0.0.1", kubeconfig.conn[0].host) }
# }
