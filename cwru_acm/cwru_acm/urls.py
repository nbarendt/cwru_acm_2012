from django.conf.urls import patterns, include, url
from django.views.generic import ListView
from roster.models import Course

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'cwru_acm.views.home', name='home'),
    # url(r'^cwru_acm/', include('cwru_acm.foo.urls')),

    url(r'^$', ListView.as_view(model=Course, template_name='course_list.html')),

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)
