from django.contrib import admin

# Register your models here.
from .models import USER
from .models import RASPBERRY
from .models import VIDEO
from .models import CHECK
from .models import WIFI
from .models import PERSON
from .models import TRANSRECIEVER

admin.site.register(USER)
admin.site.register(RASPBERRY)
admin.site.register(VIDEO)
admin.site.register(CHECK)
admin.site.register(WIFI)
admin.site.register(PERSON)
admin.site.register(TRANSRECIEVER)