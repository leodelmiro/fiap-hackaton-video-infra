resource "aws_sns_topic" "novo-video-recebido" {
  name = "novo-video-recebido"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.novo-video-recebido.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.processa-video_queue.arn
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.novo-video-recebido.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.video-em-processamento_queue.arn
}