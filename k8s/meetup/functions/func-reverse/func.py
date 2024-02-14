from parliament import Context, event


@event(event_type="meetup.reverse")
def main(context: Context):
    """
    Function template
    The context parameter contains the Flask request object and any
    CloudEvent received with the request.
    """
    print(context.cloud_event)
    # Add your business logic here

    # The return value here will be applied as the data attribute
    # of a CloudEvent returned to the function invoker
    return context.cloud_event.data[::-1]
