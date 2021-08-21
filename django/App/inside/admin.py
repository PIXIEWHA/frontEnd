from django.contrib import admin

# Register your models here.
from .models import USER
from .models import RASPBERRY
from .models import REPORT

admin.site.register(USER)
admin.site.register(RASPBERRY)
admin.site.register(REPORT)