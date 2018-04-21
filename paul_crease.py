from clipper_admin import ClipperConnection, KubernetesContainerManager
from subprocess import Popen, PIPE

print("Connecting...")
clipper_host_public_ip = Popen(['minikube', 'ip'], stdout=PIPE).communicate()[0].strip()
print("Listing apps...")
clipper_conn = ClipperConnection(KubernetesContainerManager(kubernetes_api_ip=clipper_host_public_ip,useInternalIP=True))
clipper_conn.start_clipper()
clipper_conn.connect()
print(clipper_conn.get_all_apps())
