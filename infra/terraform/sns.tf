resource "aws_sns_topic" "novo-video-recebido" {
  name = "novo-video-recebido"
}

resource "aws_sns_topic_subscription" "processa-video_queue_sqs_to_novo-video-recebido" {
  topic_arn = aws_sns_topic.novo-video-recebido.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.processa-video_queue.arn
}

resource "aws_sns_topic_subscription" "video-em-processamento_sqs_to_novo-video-recebido" {
  topic_arn = aws_sns_topic.novo-video-recebido.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.video-em-processamento_queue.arn
}

resource "aws_sqs_queue_policy" "processa-video_queue_sns_permission" {
  queue_url = aws_sqs_queue.processa-video_queue.id

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "sns-sqs-permission"
    Statement = [
      {
        Sid       = "Allow-SNS-SendMessage"
        Effect    = "Allow"
        Principal = "*"
        Action    = "SQS:SendMessage"
        Resource  = aws_sqs_queue.processa-video_queue.arn
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = "arn:aws:sns:${var.regionDefault}:${data.aws_caller_identity.current.account_id}:${aws_sns_topic.novo-video-recebido.name}"
          }
        }
      }
    ]
  })
}

resource "aws_sqs_queue_policy" "video-em-processamento_sns_permission" {
  queue_url = aws_sqs_queue.video-em-processamento_queue.id

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "sns-sqs-permission"
    Statement = [
      {
        Sid       = "Allow-SNS-SendMessage"
        Effect    = "Allow"
        Principal = "*"
        Action    = "SQS:SendMessage"
        Resource  = aws_sqs_queue.video-em-processamento_queue.arn
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = "arn:aws:sns:${var.regionDefault}:${data.aws_caller_identity.current.account_id}:${aws_sns_topic.novo-video-recebido.name}"
          }
        }
      }
    ]
  })
}